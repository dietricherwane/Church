class CreateBirths < ActiveRecord::Migration
  def change
    create_table :births do |t|
      t.string :firstname, limit: 150
      t.string :lastname, limit: 150
      t.string :father_firstname, limit: 150
      t.string :father_lastname, limit: 150
      t.string :mother_firstname, limit: 150
      t.string :mother_lastname, limit: 150
      t.string :birth_registry_id, limit: 50
      t.date :birthdate

      t.timestamps
    end
  end
end
