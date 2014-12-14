class CreateDepartures < ActiveRecord::Migration
  def change
    create_table :departures do |t|
      t.string :firstname, limit: 150
      t.string :lastname, limit: 150
      t.date :from
      t.date :to
      t.text :reason
      t.string :recommandation_letter_id, limit: 20
      t.string :destination_chuch, limit: 150

      t.timestamps
    end
  end
end
