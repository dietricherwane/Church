class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.string :firstname, limit: 150
      t.string :lastname, limit: 150
      t.integer :amount
      t.date :offering_date
      t.integer :offering_type_id

      t.timestamps
    end
  end
end
