require 'test_helper'

class AdminControllerTest < ActionController::TestCase

	def setup
		@base_title = 'Auth Web Application'
	end

	test "should get index" do
		get :index
		assert_response :success
		assert_select "title", "Dashboard | #{@base_title}"
	end

	test "should get login" do
		get :login
		assert_response :success
		assert_select "title", "#{@base_title}"
	end

end
