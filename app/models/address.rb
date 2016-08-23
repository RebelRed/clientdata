class Address < ActiveRecord::Base
belongs_to :entity, foreign_key: 'entity_id'
end
