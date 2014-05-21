json.array!(@region) do |region|
  json.extract! region, @field
end
