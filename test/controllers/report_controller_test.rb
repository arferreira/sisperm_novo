require 'test_helper'

class ReportControllerTest < ActionController::TestCase
  test "should get scale" do
    get :scale
    assert_response :success
  end

end
