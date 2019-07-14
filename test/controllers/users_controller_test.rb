require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_show_url
    assert_response :success
  end

<<<<<<< HEAD
=======
  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

>>>>>>> 5d09e8104b2bc71abb392c3bea55cdd402138872
end
