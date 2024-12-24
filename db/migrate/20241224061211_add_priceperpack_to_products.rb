class AddPriceperpackToProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :priceperpack, :decimal, precision: 10, scale: 2
  end
end
