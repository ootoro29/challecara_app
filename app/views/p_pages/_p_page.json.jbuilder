json.extract! p_page, :id, :title, :book_id, :writer_id, :created_at, :updated_at
json.url p_page_url(p_page, format: :json)
