class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name, limit: 150
      t.integer :devoted_id
      t.integer :status_list_id
      t.boolean :published

      t.timestamps
    end
  end
end
