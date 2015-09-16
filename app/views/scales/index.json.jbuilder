json.array!(@scales) do |scale|
  json.extract! scale, :id, :stay_id, :day_scale, :month_scale, :year_scale, :status
  json.url scale_url(scale, format: :json)
end
