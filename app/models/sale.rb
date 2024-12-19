class Sale < ApplicationRecord
  belongs_to :kiosk
  belongs_to :product
end
