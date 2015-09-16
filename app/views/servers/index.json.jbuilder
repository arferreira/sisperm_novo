json.array!(@servers) do |server|
  json.extract! server, :id, :name, :ip, :day_week
  json.url server_url(server, format: :json)
end
