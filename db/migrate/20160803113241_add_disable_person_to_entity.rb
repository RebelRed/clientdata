class AddDisablePersonToEntity < ActiveRecord::Migration
  def change
    add_column :entities, :disable_person, :boolean
  end
end
