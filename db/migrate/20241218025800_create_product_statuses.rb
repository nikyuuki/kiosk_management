class CreateProductStatuses < ActiveRecord::Migration[7.2]
  def change
    create_table :product_statuses do |t|
      t.references :kiosk, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :status
      t.integer :quantity
      t.date :date

      t.timestamps
    end
  end
end
