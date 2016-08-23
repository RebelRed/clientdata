class RemoveColumnsFromEntity < ActiveRecord::Migration
  def change
    remove_column :entities, :street, :string
    remove_column :entities, :city, :string
    remove_column :entities, :state, :string
    remove_column :entities, :country, :string
    remove_column :entities, :zip, :integer
    remove_column :entities, :tmo, :integer
  end
end
