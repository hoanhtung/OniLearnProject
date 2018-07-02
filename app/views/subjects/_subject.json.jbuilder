json.extract! subject, :id, :name, :image, :created_at, :updated_at
json.url subject_url(subject, format: :json)
