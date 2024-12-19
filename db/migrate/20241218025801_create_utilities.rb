class CreateUtilities < ActiveRecord::Migration[7.2]
  def change
    create_table :utilities do |t|
      t.references :kiosk, null: false, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
