class AddEntityIdToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :entity_id, :integer
  end
end
