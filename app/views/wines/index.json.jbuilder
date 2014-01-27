json.array!(@wines) do |wine|
  json.extract! wine, :id, :name, :grapes, :region, :string, :stored
  json.url wine_url(wine, format: :json)
end
