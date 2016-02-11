require 'test_helper'

class AdminControllerTest < ActionController::TestCase

	test "should get index" do
		get :index
		assert_response :success
		assert_select "title", "Dashboard | Auth App"
	end

	test "should get login" do
		get :login
		assert_response :success
		assert_select "title", "Login | Auth App"
	end

end
