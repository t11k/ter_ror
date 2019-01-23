require 'test_helper'

class TerRor::Model::Test < ActiveSupport::TestCase
  test "terrors" do
    Terrorist.create!(name: "Achmed", email: "dead@terrorist.com")

    terrorist = Terrorist.new(phone: "0", email: "dead@terrorist.com")
    terrorist.validate

    assert_equal([
      {
        "code" => 1001,
        "message" =>  "Name can't be blank"
      }, {
        "code" => 1002,
        "message" => "Email already taken"
      }, {
        "code" => 1003,
        "message" => "Phone format is invalid"
      }
    ], terrorist.terrors)
  end

  test "customization of errors" do
    weapon = Weapon.new(kind: "Firearm", serial_number: "111") 
    weapon.validate

    assert_equal([
      {
        "code" => 2002,
        "message" => "Serial number must be in format: '1111-2222-3333-4444-DE'.",
        "data" => {
          "available_serial_numbers" => [
            "1111-2222-3333-4444-DE",
            "5555-6666-7777-8888-PL"
          ]
        }
      }
    ], weapon.terrors)
  end
end
