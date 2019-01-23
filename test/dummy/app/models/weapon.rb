class Weapon < ApplicationRecord
  validates :kind, inclusion: {in: %w[White Firearm]}
  validates :serial_number, format: /\A\d{4}-\d{4}-\d{4}-\w{2}\z/

  on_error("serial_number_invalid") do |error|
    error.merge!(
      "data" => {
        "available_serial_numbers" => [
          "1111-2222-3333-4444-DE",
          "5555-6666-7777-8888-PL"
        ]
      }
    )
  end
end
