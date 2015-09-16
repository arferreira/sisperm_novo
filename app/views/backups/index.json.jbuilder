json.array!(@backups) do |backup|
  json.extract! backup, :id, :server_id, :job_id
  json.url backup_url(backup, format: :json)
end
