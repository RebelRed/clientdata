class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :country
      t.integer :zip
      t.string :state
      t.integer :tmo

      t.timestamps null: false
    end
  end
end
