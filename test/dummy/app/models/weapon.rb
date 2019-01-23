class Weapon < ApplicationRecord
  validates :kind, inclusion: {in: %w[White Firearm]}
  validates :serial_number, format: /\A\d{4}-\d{4}-\d{4}-\w{2}\z/
end
