require 'test_helper'

class WsdlMtnsControllerTest < ActionController::TestCase
  test "should get get_bill" do
    get :get_bill
    assert_response :success
  end

end
