require "test_helper"

class Public::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_users_update_url
    assert_response :success
  end

  test "should get unsubsscribe" do
    get public_users_unsubsscribe_url
    assert_response :success
  end

  test "should get withraw" do
    get public_users_withraw_url
    assert_response :success
  end
end
