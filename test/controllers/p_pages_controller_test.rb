require "test_helper"

class PPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @p_page = p_pages(:one)
  end

  test "should get index" do
    get p_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_p_page_url
    assert_response :success
  end

  test "should create p_page" do
    assert_difference("PPage.count") do
      post p_pages_url, params: { p_page: { book_id: @p_page.book_id, title: @p_page.title, writer_id: @p_page.writer_id } }
    end

    assert_redirected_to p_page_url(PPage.last)
  end

  test "should show p_page" do
    get p_page_url(@p_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_p_page_url(@p_page)
    assert_response :success
  end

  test "should update p_page" do
    patch p_page_url(@p_page), params: { p_page: { book_id: @p_page.book_id, title: @p_page.title, writer_id: @p_page.writer_id } }
    assert_redirected_to p_page_url(@p_page)
  end

  test "should destroy p_page" do
    assert_difference("PPage.count", -1) do
      delete p_page_url(@p_page)
    end

    assert_redirected_to p_pages_url
  end
end
