require 'test_helper'

class ControllerTest < ActionDispatch::IntegrationTest
  test "invalid params renders proper error response" do
    post '/terrorists', params: {terrorist: {name: ''}} 

    assert_response :unprocessable_entity
    assert_equal(
      {"errors"=>[{"code"=>1001, "message"=>"Name can't be blank"}]},
      JSON.parse(response.body)
    )
  end
end
