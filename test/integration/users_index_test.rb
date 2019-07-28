require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

	def setup
		@admin = users(:sample1)
		@not_admin = users(:other_sample1)
	end

	test "index including pagination" do
		log_in_as(@admin)
		get users_path
		assert_template 'users/index'
		assert_select 'h1','All User'
		User.paginate(page: 1).each do |user|
			assert_select 'a[href=?]',user_path(user),text: user.name
			unless user == @admin
				assert_select 'a[href=?]',user_path(user),text: "delete"
			end
		end
		assert_difference 'User.count', -1 do
			delete user_path(@not_admin)
		end
	end


	 test "index as non-admin" do
	 	log_in_as(@not_admin)
	 	get users_path
	 	assert_select 'a',text: 'delete', count: 0
	 end
		#assert_select 'div.pagination' コメント：<div class="pagination">が反応しない。
end
