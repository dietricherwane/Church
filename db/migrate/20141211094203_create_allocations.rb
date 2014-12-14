class CreateAllocations < ActiveRecord::Migration
  def change
    create_table :allocations do |t|
      t.string :firstname, limit: 150
      t.string :lastname, limit: 150
      t.date :from
      t.date :to
      t.string :provenance_ministry, limit: 150
      t.string :destination_ministry, limit: 150
      t.string :role, limit: 150

      t.timestamps
    end
  end
end
