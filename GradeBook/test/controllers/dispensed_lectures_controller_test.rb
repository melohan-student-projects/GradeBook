require "test_helper"

class DispensedLecturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dispensed_lecture = dispensed_lectures(:one)
  end

  test "should get index" do
    get dispensed_lectures_url
    assert_response :success
  end

  test "should get new" do
    get new_dispensed_lecture_url
    assert_response :success
  end

  test "should create dispensed_lecture" do
    assert_difference("DispensedLecture.count") do
      post dispensed_lectures_url, params: { dispensed_lecture: { lecture_id: @dispensed_lecture.lecture_id, promotion_id: @dispensed_lecture.promotion_id, semester_id: @dispensed_lecture.semester_id, user_id: @dispensed_lecture.user_id } }
    end

    assert_redirected_to dispensed_lecture_url(DispensedLecture.last)
  end

  test "should show dispensed_lecture" do
    get dispensed_lecture_url(@dispensed_lecture)
    assert_response :success
  end

  test "should get edit" do
    get edit_dispensed_lecture_url(@dispensed_lecture)
    assert_response :success
  end

  test "should update dispensed_lecture" do
    patch dispensed_lecture_url(@dispensed_lecture), params: { dispensed_lecture: { lecture_id: @dispensed_lecture.lecture_id, promotion_id: @dispensed_lecture.promotion_id, semester_id: @dispensed_lecture.semester_id, user_id: @dispensed_lecture.user_id } }
    assert_redirected_to dispensed_lecture_url(@dispensed_lecture)
  end

  test "should destroy dispensed_lecture" do
    assert_difference("DispensedLecture.count", -1) do
      delete dispensed_lecture_url(@dispensed_lecture)
    end

    assert_redirected_to dispensed_lectures_url
  end
end
