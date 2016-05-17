json.array!(@tournaments) do |tournament|
  json.extract! tournament, :id, :name, :location, :date
  json.url tournament_url(tournament, format: :json)
end
