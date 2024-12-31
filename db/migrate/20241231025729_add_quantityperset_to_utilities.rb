class AddQuantitypersetToUtilities < ActiveRecord::Migration[7.2]
  def change
    add_column :utilities, :quantityperset, :integer, default: 0
  end
end
