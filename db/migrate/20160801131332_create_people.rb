class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :job
      t.string :email
      t.string :city
      t.string :country
      t.boolean :key_contact
      t.string :tags
      t.text :notes
      t.boolean :disable_person

      t.timestamps null: false
    end
  end
end
