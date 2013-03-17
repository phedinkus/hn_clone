json.array!(@posts) do |post|
  json.extract! post, :title, :url, :user_id, :vote_counter
  json.url post_url(post, format: :json)
end