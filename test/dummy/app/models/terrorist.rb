class Terrorist < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :phone, format: /\A0\d{2}\ \d{3}-\d{3}-\d{3}\z/, allow_blank: true
end
