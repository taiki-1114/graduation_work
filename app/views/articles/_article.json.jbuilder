json.extract! article, :id, :title, :question_body, :question_answer, :created_at, :updated_at
json.url article_url(article, format: :json)
