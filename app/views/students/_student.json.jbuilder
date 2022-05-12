json.extract! student, :id, :usn, :name, :gender, :phonenumber, :created_at, :updated_at
json.url student_url(student, format: :json)
