require 'test_helper'

class Admin::PurchasesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_purchases_index_url
    assert_response :success
  end

end
