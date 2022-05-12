json.extract! course, :id, :course_code, :course_name, :cee_max, :see_max, :created_at, :updated_at
json.url course_url(course, format: :json)
