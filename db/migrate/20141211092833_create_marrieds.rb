class CreateMarrieds < ActiveRecord::Migration
  def change
    create_table :marrieds do |t|
      t.integer :marital_status_id
      t.string :spouse_firstname, limit: 150
      t.string :spouse_lastname, limit: 150
      t.date :spouse_birthdate
      t.string :spouse_birth_registry_number, limit: 50
      t.integer :number_of_children
      t.integer :tribe_id
      t.string :wedding_ministry, limit: 150
      t.string :wedding_church, limit: 150

      t.timestamps
    end
  end
end
