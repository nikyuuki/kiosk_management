class Utility < ApplicationRecord
  belongs_to :kiosk

  validates :name, presence: true
  validates :description, presence: true
  validates :kiosk_id, presence: true
end
