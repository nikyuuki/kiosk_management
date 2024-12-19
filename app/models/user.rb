class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_secure_password
    has_many :attendant_shifts
    has_many :product_statuses
    has_many :utility_statuses
    has_many :sales
  end
  