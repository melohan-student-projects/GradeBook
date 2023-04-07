require "application_system_test_case"

class DispensedLecturesTest < ApplicationSystemTestCase
  setup do
    @dispensed_lecture = dispensed_lectures(:one)
  end

  test "visiting the index" do
    visit dispensed_lectures_url
    assert_selector "h1", text: "Dispensed lectures"
  end

  test "should create dispensed lecture" do
    visit dispensed_lectures_url
    click_on "New dispensed lecture"

    fill_in "Lecture", with: @dispensed_lecture.lecture_id
    fill_in "Promotion", with: @dispensed_lecture.promotion_id
    fill_in "Semester", with: @dispensed_lecture.semester_id
    fill_in "User", with: @dispensed_lecture.user_id
    click_on "Create Dispensed lecture"

    assert_text "Dispensed lecture was successfully created"
    click_on "Back"
  end

  test "should update Dispensed lecture" do
    visit dispensed_lecture_url(@dispensed_lecture)
    click_on "Edit this dispensed lecture", match: :first

    fill_in "Lecture", with: @dispensed_lecture.lecture_id
    fill_in "Promotion", with: @dispensed_lecture.promotion_id
    fill_in "Semester", with: @dispensed_lecture.semester_id
    fill_in "User", with: @dispensed_lecture.user_id
    click_on "Update Dispensed lecture"

    assert_text "Dispensed lecture was successfully updated"
    click_on "Back"
  end

  test "should destroy Dispensed lecture" do
    visit dispensed_lecture_url(@dispensed_lecture)
    click_on "Destroy this dispensed lecture", match: :first

    assert_text "Dispensed lecture was successfully destroyed"
  end
end
