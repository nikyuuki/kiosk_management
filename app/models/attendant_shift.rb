class AttendantShift < ApplicationRecord
  belongs_to :user
  belongs_to :kiosk

  # validates :time_in, presence: true
  # validates :time_out, presence: true, if: :checked_out?

  def self.check_in(user)
    # Make sure there's no existing check-in without check-out
    if user.attendances.where(checked_out_at: nil).exists?
      return false # User already checked in and hasn't checked out
    end

    # Create a new attendance record with the current time as checked_in_at
    Attendance.create(user: user, checked_in_at: Time.current)
  end

  def self.check_out(user)
    # Find the attendance record where checked_in_at is present and checked_out_at is nil
    attendance = user.attendances.find_by(checked_out_at: nil)

    if attendance
      attendance.update(checked_out_at: Time.current)
      return true
    else
      return false # No active check-in found for this user
    end
  end
end
