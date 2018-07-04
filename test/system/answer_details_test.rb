require "application_system_test_case"

class AnswerDetailsTest < ApplicationSystemTestCase
  setup do
    @answer_detail = answer_details(:one)
  end

  test "visiting the index" do
    visit answer_details_url
    assert_selector "h1", text: "Answer Details"
  end

  test "creating a Answer detail" do
    visit answer_details_url
    click_on "New Answer Detail"

    click_on "Create Answer detail"

    assert_text "Answer detail was successfully created"
    click_on "Back"
  end

  test "updating a Answer detail" do
    visit answer_details_url
    click_on "Edit", match: :first

    click_on "Update Answer detail"

    assert_text "Answer detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Answer detail" do
    visit answer_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Answer detail was successfully destroyed"
  end
end
