class CreateMaritalStatusLists < ActiveRecord::Migration
  def change
    create_table :marital_status_lists do |t|
      t.string :name, limit: 150
      t.boolean :published

      t.timestamps
    end
  end
end
