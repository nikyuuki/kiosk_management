class CreateSales < ActiveRecord::Migration[7.2]
  def change
    create_table :sales do |t|
      t.references :kiosk, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :total_price
      t.date :date

      t.timestamps
    end
  end
end
