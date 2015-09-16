json.array!(@jobs) do |job|
  json.extract! job, :id, :user_id, :day_thread, :alteration
  json.url job_url(job, format: :json)
end
