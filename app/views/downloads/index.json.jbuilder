json.array!(@downloads) do |download|
  json.extract! download, :id, :name, :filename, :type, :description, :hits
end
