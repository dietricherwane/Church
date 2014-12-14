class RemoveBaptisedFromDevoteds < ActiveRecord::Migration
  def change
    remove_column :devoteds, :baptised
  end
end
