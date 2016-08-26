class Entity < ActiveRecord::Base
has_many :addresses 
accepts_nested_attributes_for :addresses, allow_destroy: true

  self.per_page = 5

def self.search(search)
	where("entity_name LIKE :search OR existing_type LIKE :search OR credit LIKE :search ", search: "%#{search}%")
	
end


end
