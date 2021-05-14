json.extract! textfile, :id, :file_url, :created_at, :updated_at
json.url textfile_url(textfile, format: :json)
