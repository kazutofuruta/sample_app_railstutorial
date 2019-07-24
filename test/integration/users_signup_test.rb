require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

	test "invaild signup information" do
		get signup_path
		assert_no_difference 'User.count' do
		post signup_path, params: { user: { name: "",
				      		email: "user@invalid",
						password: "foo",
						password_confirmation: "bar" } }
		end
	assert_template "users/new"
	assert_select 'form[action="/signup"]'

end

	test "validate signup information" do
		get signup_path
		assert_difference 'User.count', 1 do
			post signup_path, params: { user: { name: "kazuto",
				       			email: "kazuto@furuta.com",
							password: "kazukazu",
							password_confirmation: "kazukazu" } }
		end
		follow_redirect!
		assert_template 'users/show'
		assert_not flash.empty?
		assert is_logged_in?
	end
end
