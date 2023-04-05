require "test_helper"

class UserPromotionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_promotion = user_promotions(:one)
  end

  test "should get index" do
    get user_promotions_url
    assert_response :success
  end

  test "should get new" do
    get new_user_promotion_url
    assert_response :success
  end

  test "should create user_promotion" do
    assert_difference("UserPromotion.count") do
      post user_promotions_url, params: { user_promotion: { promotion_id: @user_promotion.promotion_id, user_id: @user_promotion.user_id } }
    end

    assert_redirected_to user_promotion_url(UserPromotion.last)
  end

  test "should show user_promotion" do
    get user_promotion_url(@user_promotion)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_promotion_url(@user_promotion)
    assert_response :success
  end

  test "should update user_promotion" do
    patch user_promotion_url(@user_promotion), params: { user_promotion: { promotion_id: @user_promotion.promotion_id, user_id: @user_promotion.user_id } }
    assert_redirected_to user_promotion_url(@user_promotion)
  end

  test "should destroy user_promotion" do
    assert_difference("UserPromotion.count", -1) do
      delete user_promotion_url(@user_promotion)
    end

    assert_redirected_to user_promotions_url
  end
end
