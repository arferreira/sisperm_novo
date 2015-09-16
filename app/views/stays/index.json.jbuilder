json.array!(@stays) do |stay|
  json.extract! stay, :id, :user_id, :name, :status
  json.url stay_url(stay, format: :json)
end
