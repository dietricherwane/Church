class CreateWeddings < ActiveRecord::Migration
  def change
    create_table :weddings do |t|
      t.string :husband_firstname, limit: 150
      t.string :husband_lastname, limit: 150
      t.string :wife_firstname, limit: 150
      t.string :wife_lastname, limit: 150
      t.date :wedding_date
      t.string :church, limit: 150

      t.timestamps
    end
  end
end
