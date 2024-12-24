class RemoveKioskIdFromUtilities < ActiveRecord::Migration[7.2]
  def change
    # Remove the index associated with kiosk_id
    remove_index :utilities, :kiosk_id

    # Remove the kiosk_id column
    remove_column :utilities, :kiosk_id, :bigint
  end
end
