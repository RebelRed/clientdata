class Entity < ActiveRecord::Base

   include PublicActivity::Common
   #tracked owner: ->(controller, model) { controller && controller.current_user }



has_many :addresses 
accepts_nested_attributes_for :addresses,  allow_destroy: true, reject_if: :reject_addresses

  self.per_page = 5


def reject_addresses(attributes)

 attributes['street'].blank?
end



def self.search(search)
	where("entity_name LIKE :search OR existing_type LIKE :search OR credit LIKE :search ", search: "%#{search}%")
	
end


end
