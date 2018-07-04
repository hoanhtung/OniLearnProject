require 'test_helper'

class ExamDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exam_detail = exam_details(:one)
  end

  test "should get index" do
    get exam_details_url
    assert_response :success
  end

  test "should get new" do
    get new_exam_detail_url
    assert_response :success
  end

  test "should create exam_detail" do
    assert_difference('ExamDetail.count') do
      post exam_details_url, params: { exam_detail: {  } }
    end

    assert_redirected_to exam_detail_url(ExamDetail.last)
  end

  test "should show exam_detail" do
    get exam_detail_url(@exam_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_exam_detail_url(@exam_detail)
    assert_response :success
  end

  test "should update exam_detail" do
    patch exam_detail_url(@exam_detail), params: { exam_detail: {  } }
    assert_redirected_to exam_detail_url(@exam_detail)
  end

  test "should destroy exam_detail" do
    assert_difference('ExamDetail.count', -1) do
      delete exam_detail_url(@exam_detail)
    end

    assert_redirected_to exam_details_url
  end
end
