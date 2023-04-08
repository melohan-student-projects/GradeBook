json.extract! user_promotion, :id, :promotion_id, :user_id, :created_at, :updated_at
json.url user_promotion_url(user_promotion, format: :json)
