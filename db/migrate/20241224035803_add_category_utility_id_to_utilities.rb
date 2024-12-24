class AddCategoryUtilityIdToUtilities < ActiveRecord::Migration[7.2]
  def change
    add_reference :utilities, :category_utility, foreign_key: true, null: true
  end
end
