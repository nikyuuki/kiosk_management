class CreateUtilityStatuses < ActiveRecord::Migration[7.2]
  def change
    create_table :utility_statuses do |t|
      t.references :kiosk, null: false, foreign_key: true
      t.references :utility, null: false, foreign_key: true
      t.string :status
      t.string :description
      t.date :date

      t.timestamps
    end
  end
end
