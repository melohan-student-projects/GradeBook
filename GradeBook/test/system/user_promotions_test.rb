require "application_system_test_case"

class UserPromotionsTest < ApplicationSystemTestCase
  setup do
    @user_promotion = user_promotions(:one)
  end

  test "visiting the index" do
    visit user_promotions_url
    assert_selector "h1", text: "User promotions"
  end

  test "should create user promotion" do
    visit user_promotions_url
    click_on "New user promotion"

    fill_in "Promotion", with: @user_promotion.promotion_id
    fill_in "User", with: @user_promotion.user_id
    click_on "Create User promotion"

    assert_text "User promotion was successfully created"
    click_on "Back"
  end

  test "should update User promotion" do
    visit user_promotion_url(@user_promotion)
    click_on "Edit this user promotion", match: :first

    fill_in "Promotion", with: @user_promotion.promotion_id
    fill_in "User", with: @user_promotion.user_id
    click_on "Update User promotion"

    assert_text "User promotion was successfully updated"
    click_on "Back"
  end

  test "should destroy User promotion" do
    visit user_promotion_url(@user_promotion)
    click_on "Destroy this user promotion", match: :first

    assert_text "User promotion was successfully destroyed"
  end
end
