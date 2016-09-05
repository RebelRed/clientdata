class RenameDisabledPersonInUsersToDisabledUser < ActiveRecord::Migration
  def change
  	rename_column :users, :disable_person, :disable_user
  end
end
