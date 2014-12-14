class CreateOfferingTypes < ActiveRecord::Migration
  def change
    create_table :offering_types do |t|
      t.string :name, limit: 150
      t.boolean :published

      t.timestamps
    end
  end
end
