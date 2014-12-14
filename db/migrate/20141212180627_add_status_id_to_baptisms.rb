class AddStatusIdToBaptisms < ActiveRecord::Migration
  def change
    add_column :baptisms, :status_id, :integer
  end
end
