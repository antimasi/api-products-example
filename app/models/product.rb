class Product < ApplicationRecord
  SKU_LENGTH = 12
  validates :name, presence: true
  validates :description, presence: true
  validates :sku, presence: true
  validates :price, numericality: { greater_than: 0 }

  before_validation :set_data

  def set_data        
    sku_already_exists = true
    while sku_already_exists      
      self.sku = SecureRandom.random_number(("9" * SKU_LENGTH).to_i)
      sku_already_exists = Product.where(sku: sku).first.present?            
    end
  end

  def to_api
    {
      id: id,
      title: name,
      description: description,
      sku: sku,
      unit_price: price,
      added_in: created_at.strftime("%Y-%m-%d")
    }
  end
end
