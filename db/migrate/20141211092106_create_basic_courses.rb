class CreateBasicCourses < ActiveRecord::Migration
  def change
    create_table :basic_courses do |t|
      t.boolean :status
      t.integer :status_id

      t.timestamps
    end
  end
end
