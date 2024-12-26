class UtilityStatus < ApplicationRecord
  belongs_to :kiosk
  belongs_to :utility

  validates :status_opening, inclusion: { in: [true, false] }
  validates :status_closing, inclusion: { in: [true, false] }
end
