class AddPeopleInformationToUsersTable < ActiveRecord::Migration
  def change

      add_column :users, :first_name, :string
      add_column :users, :last_name, :string
      
      add_column :users, :city, :string
      add_column :users, :country, :string
      add_column :users, :key_contact, :boolean
      add_column :users, :tags, :string
      add_column :users, :notes, :text
      add_column :users, :disable_person, :boolean
  	
  end
end
