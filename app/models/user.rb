class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



    has_many :entities
   acts_as_taggable
   acts_as_taggable_on :tags

  self.per_page = 3

	def self.search(search)
		where('first_name LIKE :search OR email LIKE :search OR tags LIKE :search OR key_contact LIKE :search', search: "%#{search}%") 
    end

end
