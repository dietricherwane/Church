class RemoveDevotedIdFromStatusesAndStatusIdFromBaptisms < ActiveRecord::Migration
  def change
    drop_table :statuses

    create_table :statuses do |t|
      t.string :name, limit: 150
      t.belongs_to :devoted
      t.integer :status_list_id
      t.boolean :published

      t.timestamps
    end

    drop_table :baptisms

    create_table :baptisms do |t|
      t.date :baptism_date
      t.string :place, limit: 150
      t.string :ministry, limit: 150
      t.integer :baptist_responsibility_id
      t.belongs_to :status

      t.timestamps
    end
  end
end
