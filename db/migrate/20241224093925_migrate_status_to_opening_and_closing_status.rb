class MigrateStatusToOpeningAndClosingStatus < ActiveRecord::Migration[7.2]
  def up
    # Update utility statuses based on the current 'status' column
    UtilityStatus.find_each do |utility_status|
      case utility_status.status
      when 'opening'
        utility_status.update(status_opening: true)
      when 'closing'
        utility_status.update(status_closing: true)
      end
    end
  end

  def down
    # In case you need to rollback, restore status column
    add_column :utility_statuses, :status, :string

    # Restore original status values based on opening and closing statuses
    UtilityStatus.find_each do |utility_status|
      if utility_status.status_opening
        utility_status.update(status: 'opening')
      elsif utility_status.status_closing
        utility_status.update(status: 'closing')
      end
    end
  end
end