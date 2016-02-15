require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

	test "layout links" do
		get root_path
		assert_template "layouts/_navbar"
		assert_select "a[href=?]", root_path, count: 2
		assert_select "a[href=?]", new_user_path
		assert_select "a[href=?]", login_path
		get new_user_path
		assert_select "title", full_title("Sign up")
	end

end
