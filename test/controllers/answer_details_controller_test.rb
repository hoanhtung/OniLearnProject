require 'test_helper'

class AnswerDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @answer_detail = answer_details(:one)
  end

  test "should get index" do
    get answer_details_url
    assert_response :success
  end

  test "should get new" do
    get new_answer_detail_url
    assert_response :success
  end

  test "should create answer_detail" do
    assert_difference('AnswerDetail.count') do
      post answer_details_url, params: { answer_detail: {  } }
    end

    assert_redirected_to answer_detail_url(AnswerDetail.last)
  end

  test "should show answer_detail" do
    get answer_detail_url(@answer_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_answer_detail_url(@answer_detail)
    assert_response :success
  end

  test "should update answer_detail" do
    patch answer_detail_url(@answer_detail), params: { answer_detail: {  } }
    assert_redirected_to answer_detail_url(@answer_detail)
  end

  test "should destroy answer_detail" do
    assert_difference('AnswerDetail.count', -1) do
      delete answer_detail_url(@answer_detail)
    end

    assert_redirected_to answer_details_url
  end
end
