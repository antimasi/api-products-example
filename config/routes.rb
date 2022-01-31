Rails.application.routes.draw do
  get 'home/index'

  namespace :api do
    scope ":key_id" do
      namespace :v1 do
        resources :products, only:[:index,:show]
        
      end
    end
  end  
  root "home#index"
end
