require 'test_helper'

class MibBrowserControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    
    assert_response :success
    assert_not_nil assigns(:mibs)
  end
  
  
end
