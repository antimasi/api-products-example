class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price, default: 0
      t.string :sku, null: false

      t.timestamps
    end
    add_index :products, :sku
  end
end
