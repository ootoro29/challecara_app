json.extract! q_page, :id, :title, :book_id, :writer_id, :created_at, :updated_at
json.url q_page_url(q_page, format: :json)
