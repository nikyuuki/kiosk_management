class AddCodeToProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :code, :string
  end
end
