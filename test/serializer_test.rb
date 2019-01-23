require 'test_helper'

class TerRor::Serializer::Test < ActiveSupport::TestCase
  test "codes with messages for given record" do
    terrorist = Terrorist.new(phone: "123")
    terrorist.validate

    assert_equal({
      "name_blank" => {
        "code" => 1001,
        "message" => "Name can't be blank"
      },
      "phone_invalid" => {
        "code" => 1003,
        "message" => "Phone format is invalid"
      }
    }, TerRor::Serializer.call(terrorist))
  end
end
