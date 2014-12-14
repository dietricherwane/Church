class CreateArrivals < ActiveRecord::Migration
  def change
    create_table :arrivals do |t|
      t.string :firstname, limit: 150
      t.string :lastname, limit: 150
      t.date :from
      t.string :recommandation_letter_id, limit: 20
      t.string :origin_chuch, limit: 150

      t.timestamps
    end
  end
end
