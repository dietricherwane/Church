class CreateSocialStatuses < ActiveRecord::Migration
  def change
    create_table :social_statuses do |t|
      t.integer :devoted_id
      t.integer :social_status_list_id
      t.boolean :published

      t.timestamps
    end
  end
end
