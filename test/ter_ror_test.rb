require 'test_helper'

class TerRor::Test < ActiveSupport::TestCase
  test "config has proper type" do
    assert_instance_of TerRor::Config, TerRor.config
  end

  test "configure yields config" do
    TerRor.configure do |config|
      assert_equal TerRor.config, config
    end
  end

  test "loads definitions" do
    TerRor.codes = nil
    TerRor.messages = nil

    path = Dummy::Application.new.root

    TerRor.load(path)
    
    assert_instance_of TerRor::Codes, TerRor.codes
    assert_instance_of TerRor::Messages, TerRor.messages
  end
end
