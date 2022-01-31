class Api::V1::ProductsController < ApplicationController
  before_action :authenticate

  API_KEY = "adKz4so2dvIE4rQ2oRU0sb7bPNm9YO3kySkmoxLP"
  KEY_TOKEN = "jWgFLWP2gkgWqCd7YpqwbSyfbioTV2i4TKQswR4"

  
  def index
    render json: {products: Product.all.map{|p| p.to_api}}, status: 200
  end

  def show
    product = Product.find(params[:id])
    if product.present?
      render json: product.to_api, status: 200
    else
      render json:  {errors: "not found"}, status: 400
    end
  end

  private 

  def authenticate    
    key_id = params[:key_id].to_s
    token = request.headers['X-AUTH-TOKEN'].to_s
    unless ActiveSupport::SecurityUtils.secure_compare(API_KEY, key_id) && ActiveSupport::SecurityUtils.secure_compare(KEY_TOKEN, token)
      render json: {errors: "Unauthorized"}, status: 401
    end
  end
end
