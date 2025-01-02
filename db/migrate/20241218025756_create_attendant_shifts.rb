class CreateAttendantShifts < ActiveRecord::Migration[7.2]
  def change
    create_table :attendant_shifts do |t|
      t.references :kiosk, null: false, foreign_key: true
      t.datetime :checked_in_at, null: false            
      t.datetime :checked_out_at 
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
