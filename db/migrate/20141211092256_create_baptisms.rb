class CreateBaptisms < ActiveRecord::Migration
  def change
    create_table :baptisms do |t|
      t.date :baptism_date
      t.string :place, limit: 150
      t.string :ministry, limit: 150
      t.integer :baptist_responsibility_id
      t.integer :status_id

      t.timestamps
    end
  end
end
