class RemoveCategoryFromProducts < ActiveRecord::Migration[7.2]
  def change
    remove_column :products, :category
  end
end
