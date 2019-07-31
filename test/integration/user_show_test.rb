require 'test_helper'

class UserShowTest < ActionDispatch::IntegrationTest

    def setup
    	@user = users(:sample1)
    	@no_activated_user = users(:lana)
    end


    test "show account activated true only" do
    	log_in_as(@user)
    	get user_path(@no_activated_user)
    	assert_redirected_to root_path
    	follow_redirect!
    	assert_template 'static_pages/home'
    end


end
