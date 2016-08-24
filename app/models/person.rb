class Person < ActiveRecord::Base

  self.per_page = 3

def self.search(search)
	where('first_name LIKE :search OR email LIKE :search OR tags LIKE :search', search: "%#{search}%") 

end

end
