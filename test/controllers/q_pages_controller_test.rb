require "test_helper"

class QPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @q_page = q_pages(:one)
  end

  test "should get index" do
    get q_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_q_page_url
    assert_response :success
  end

  test "should create q_page" do
    assert_difference("QPage.count") do
      post q_pages_url, params: { q_page: { book_id: @q_page.book_id, title: @q_page.title, writer_id: @q_page.writer_id } }
    end

    assert_redirected_to q_page_url(QPage.last)
  end

  test "should show q_page" do
    get q_page_url(@q_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_q_page_url(@q_page)
    assert_response :success
  end

  test "should update q_page" do
    patch q_page_url(@q_page), params: { q_page: { book_id: @q_page.book_id, title: @q_page.title, writer_id: @q_page.writer_id } }
    assert_redirected_to q_page_url(@q_page)
  end

  test "should destroy q_page" do
    assert_difference("QPage.count", -1) do
      delete q_page_url(@q_page)
    end

    assert_redirected_to q_pages_url
  end
end
