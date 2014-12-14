class CreateStatusLists < ActiveRecord::Migration
  def change
    create_table :status_lists do |t|
      t.string :name, limit: 150
      t.boolean :published

      t.timestamps
    end
  end
end
