require "application_system_test_case"

class ExamDetailsTest < ApplicationSystemTestCase
  setup do
    @exam_detail = exam_details(:one)
  end

  test "visiting the index" do
    visit exam_details_url
    assert_selector "h1", text: "Exam Details"
  end

  test "creating a Exam detail" do
    visit exam_details_url
    click_on "New Exam Detail"

    click_on "Create Exam detail"

    assert_text "Exam detail was successfully created"
    click_on "Back"
  end

  test "updating a Exam detail" do
    visit exam_details_url
    click_on "Edit", match: :first

    click_on "Update Exam detail"

    assert_text "Exam detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Exam detail" do
    visit exam_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exam detail was successfully destroyed"
  end
end
