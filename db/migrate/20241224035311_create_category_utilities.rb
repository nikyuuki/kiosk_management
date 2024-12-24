class CreateCategoryUtilities < ActiveRecord::Migration[7.2]
  def change
    unless table_exists?(:category_utilities)
      create_table :category_utilities do |t|
        t.string :name, null: false
        t.timestamps
      end

      add_index :category_utilities, :name, unique: true
    end
  end
end
