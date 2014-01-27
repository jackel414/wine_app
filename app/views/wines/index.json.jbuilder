json.array!(@wines) do |wine|
  json.extract! wine, :id, :name, :grapes, :region, :country, :stored
  json.url wine_url(wine, format: :json)
end
