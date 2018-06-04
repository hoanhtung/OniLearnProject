json.extract! course, :id, :name, :description, :icon, :created_at, :updated_at
json.url course_url(course, format: :json)
