class CreateTribes < ActiveRecord::Migration
  def change
    create_table :tribes do |t|
      t.string :name, limit: 150
      t.boolean :published

      t.timestamps
    end
  end
end
