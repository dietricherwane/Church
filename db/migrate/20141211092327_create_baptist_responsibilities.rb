class CreateBaptistResponsibilities < ActiveRecord::Migration
  def change
    create_table :baptist_responsibilities do |t|
      t.string :name, limit: 150
      t.boolean :published

      t.timestamps
    end
  end
end
