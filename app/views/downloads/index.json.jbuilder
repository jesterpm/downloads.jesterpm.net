json.array!(@downloads) do |download|
  json.extract! download, :id, :name, :filename, :type, :description, :hits
  json.href request.base_url + download_path(download.filename)
end
