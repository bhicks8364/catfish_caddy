json.array!(@fish) do |fish|
  json.extract! fish, :id, :color_id, :weight, :over_28, :tournament_id, :user_id
  json.url fish_url(fish, format: :json)
end
