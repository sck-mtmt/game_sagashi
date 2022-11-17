require "test_helper"

class Public::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_reviews_new_url
    assert_response :success
  end

  test "should get confirm" do
    get public_reviews_confirm_url
    assert_response :success
  end

  test "should get complete" do
    get public_reviews_complete_url
    assert_response :success
  end
end
