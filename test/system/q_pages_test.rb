require "application_system_test_case"

class QPagesTest < ApplicationSystemTestCase
  setup do
    @q_page = q_pages(:one)
  end

  test "visiting the index" do
    visit q_pages_url
    assert_selector "h1", text: "Q pages"
  end

  test "should create q page" do
    visit q_pages_url
    click_on "New q page"

    fill_in "Book", with: @q_page.book_id
    fill_in "Title", with: @q_page.title
    fill_in "Writer", with: @q_page.writer_id
    click_on "Create Q page"

    assert_text "Q page was successfully created"
    click_on "Back"
  end

  test "should update Q page" do
    visit q_page_url(@q_page)
    click_on "Edit this q page", match: :first

    fill_in "Book", with: @q_page.book_id
    fill_in "Title", with: @q_page.title
    fill_in "Writer", with: @q_page.writer_id
    click_on "Update Q page"

    assert_text "Q page was successfully updated"
    click_on "Back"
  end

  test "should destroy Q page" do
    visit q_page_url(@q_page)
    click_on "Destroy this q page", match: :first

    assert_text "Q page was successfully destroyed"
  end
end
