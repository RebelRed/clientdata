class AddAddressesEntitiesToEntities < ActiveRecord::Migration
  def change
  	create_table :addresses_entities do |t|
      t.string :street
      t.string :city
      t.string :country
      t.integer :zip
      t.string :state
      t.integer :tmo
      t.integer :entity_id
      t.timestamps null: false
    end
  end
end
