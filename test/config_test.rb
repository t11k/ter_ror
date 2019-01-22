require 'test_helper'

class TerRor::Config::Test < ActiveSupport::TestCase
  test "default codes filepath" do
    assert_equal "config/error_codes.yml", TerRor::Config.new.codes_filepath
  end

  test "default messages filepath" do
    assert_equal "config/error_messages.yml", TerRor::Config.new.messages_filepath
  end

  test "assign custom codes filepath" do
    config = TerRor::Config.new
    config.codes_filepath = "custom/filepath.yml"

    assert_equal "custom/filepath.yml", config.codes_filepath
  end

  test "assign custom messages filepath" do
    config = TerRor::Config.new
    config.messages_filepath = "custom/filepath.yml"

    assert_equal "custom/filepath.yml", config.messages_filepath
  end
end
