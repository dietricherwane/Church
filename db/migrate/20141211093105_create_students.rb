class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :class_branch, limit: 150
      t.string :school, limit: 150
      t.string :school_phone_number, limit: 150
      t.integer :social_status_id

      t.timestamps
    end
  end
end
