json.extract! post, :id, :published_at, :user_id, :title, :html, :status,
              :created_at, :updated_at
json.url post_url(post, format: :json)
