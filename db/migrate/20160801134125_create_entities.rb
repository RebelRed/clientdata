class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :selector
      t.string :entity_name
      t.string :existing_type
      t.string :billing
      t.integer :credit
      t.text :notes
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.integer :tmo

      t.timestamps null: false
    end
  end
end
