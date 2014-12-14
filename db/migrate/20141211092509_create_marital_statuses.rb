class CreateMaritalStatuses < ActiveRecord::Migration
  def change
    create_table :marital_statuses do |t|
      t.integer :marital_status_list_id
      t.integer :devoted_id
      t.boolean :published

      t.timestamps
    end
  end
end
