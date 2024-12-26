class AddOpeningAndClosingStatusToUtilityStatuses < ActiveRecord::Migration[7.2]
  def change
    add_column :utility_statuses, :status_opening, :boolean, default: false
    add_column :utility_statuses, :status_closing, :boolean, default: false

    # Remove the old status column
    remove_column :utility_statuses, :status, :string
  end
end
