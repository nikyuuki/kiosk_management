class ProductStatus < ApplicationRecord
  belongs_to :kiosk
  belongs_to :user
  belongs_to :product
end
