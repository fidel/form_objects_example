json.array!(@users) do |user|
  json.extract! user, :id, :email, :name, :company_id
  json.url user_url(user, format: :json)
end
