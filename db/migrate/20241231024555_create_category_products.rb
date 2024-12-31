class CreateCategoryProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :category_products do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_index :category_products, :name, unique: true
  end
end
