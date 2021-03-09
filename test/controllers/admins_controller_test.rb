require "test_helper"

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get admins_dashboard_url
    assert_response :success
  end

  test "should get index" do
    get admins_index_url
    assert_response :success
  end

  test "should get new_user" do
    get admins_new_user_url
    assert_response :success
  end

  test "should get create_user" do
    get admins_create_user_url
    assert_response :success
  end
end
