json.array!(@downloads) do |download|
  json.extract! download, :id, :name, :filename, :type, :description, :hits
  json.url download_url(download, format: :json)
end
