require 'test_helper'

class TerRor::Codes::Test < ActiveSupport::TestCase
  test "get codes for given class and errors" do
    codes = TerRor::Codes.new(
      "person" => {
        "name_blank"  => 2001,
        "email_taken" => 2022,
        "phone_invalid" => 2033
      },
      "page" => {
        "url_invalid" => 3333
      }
    )

    assert_equal({
      "name_blank" => 2001,
      "phone_invalid" => 2033
    }, codes.get("person", "name_blank", "phone_invalid"))
  end
end
