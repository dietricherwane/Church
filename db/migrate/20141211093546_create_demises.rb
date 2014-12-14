class CreateDemises < ActiveRecord::Migration
  def change
    create_table :demises do |t|
      t.string :firstname, limit: 150
      t.string :lastname, limit: 150
      t.text :description
      t.date :from
      t.integer :number_of_children
      t.string :wife_husband_firstname, limit: 150
      t.string :wife_husband_lastname, limit: 150

      t.timestamps
    end
  end
end
