json.array!(@disclosures) do |disclosure|
  json.extract! disclosure, :id, :title, :abstract, :body, :consented
  json.url disclosure_url(disclosure, format: :json)
end
