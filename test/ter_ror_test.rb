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

  test "application init" do
    TerRor.codes = nil
    TerRor.messages = nil

    app = Dummy::Application.new

    TerRor.init(app)
    
    assert_instance_of TerRor::Codes, TerRor.codes
    assert_instance_of TerRor::Messages, TerRor.messages
    assert_includes ApplicationController, TerRor::Controller
    assert_includes ApplicationRecord, TerRor::Model
  end
end
