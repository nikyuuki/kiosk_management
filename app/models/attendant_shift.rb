class AttendantShift < ApplicationRecord
  belongs_to :user
  belongs_to :kiosk
end
