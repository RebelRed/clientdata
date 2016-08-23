json.extract! person, :id, :first_name, :last_name, :job, :email, :city, :country, :key_contact, :tags, :notes, :disable_person, :created_at, :updated_at
json.url person_url(person, format: :json)