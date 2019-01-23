require 'test_helper'

class TerRor::Record::Test < ActiveSupport::TestCase
  test "error codes" do
    terrorist = Terrorist.new
    terrorist.validate

    record = TerRor::Record.new(terrorist)

    assert_equal({"name_blank" => 1001}, record.error_codes)
  end
end
