require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  test "should get show" do
    get :index
    assert_response :success
  end



end
