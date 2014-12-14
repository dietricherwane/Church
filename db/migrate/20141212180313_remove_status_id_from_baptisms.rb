class RemoveStatusIdFromBaptisms < ActiveRecord::Migration
  def change
    remove_column :baptisms, :status_id
  end
end
