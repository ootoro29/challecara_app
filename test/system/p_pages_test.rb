require "application_system_test_case"

class PPagesTest < ApplicationSystemTestCase
  setup do
    @p_page = p_pages(:one)
  end

  test "visiting the index" do
    visit p_pages_url
    assert_selector "h1", text: "P pages"
  end

  test "should create p page" do
    visit p_pages_url
    click_on "New p page"

    fill_in "Book", with: @p_page.book_id
    fill_in "Title", with: @p_page.title
    fill_in "Writer", with: @p_page.writer_id
    click_on "Create P page"

    assert_text "P page was successfully created"
    click_on "Back"
  end

  test "should update P page" do
    visit p_page_url(@p_page)
    click_on "Edit this p page", match: :first

    fill_in "Book", with: @p_page.book_id
    fill_in "Title", with: @p_page.title
    fill_in "Writer", with: @p_page.writer_id
    click_on "Update P page"

    assert_text "P page was successfully updated"
    click_on "Back"
  end

  test "should destroy P page" do
    visit p_page_url(@p_page)
    click_on "Destroy this p page", match: :first

    assert_text "P page was successfully destroyed"
  end
end
