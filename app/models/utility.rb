class Utility < ApplicationRecord
  belongs_to :category_utility

  validates :name, presence: true
end
