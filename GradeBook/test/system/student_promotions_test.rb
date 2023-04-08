require "application_system_test_case"

class StudentPromotionsTest < ApplicationSystemTestCase
  setup do
    @student_promotion = student_promotions(:one)
  end

  test "visiting the index" do
    visit student_promotions_url
    assert_selector "h1", text: "Student promotions"
  end

  test "should create student promotion" do
    visit student_promotions_url
    click_on "New student promotion"

    fill_in "Promotion", with: @student_promotion.promotion_id
    fill_in "Student", with: @student_promotion.student_id
    click_on "Create Student promotion"

    assert_text "Student promotion was successfully created"
    click_on "Back"
  end

  test "should update Student promotion" do
    visit student_promotion_url(@student_promotion)
    click_on "Edit this student promotion", match: :first

    fill_in "Promotion", with: @student_promotion.promotion_id
    fill_in "Student", with: @student_promotion.student_id
    click_on "Update Student promotion"

    assert_text "Student promotion was successfully updated"
    click_on "Back"
  end

  test "should destroy Student promotion" do
    visit student_promotion_url(@student_promotion)
    click_on "Destroy this student promotion", match: :first

    assert_text "Student promotion was successfully destroyed"
  end
end
