class ComboProduct < ApplicationRecord
  belongs_to :combo
  belongs_to :product
end
