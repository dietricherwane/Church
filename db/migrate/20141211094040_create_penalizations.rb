class CreatePenalizations < ActiveRecord::Migration
  def change
    create_table :penalizations do |t|
      t.string :firstname, limit: 150
      t.string :lastname, limit: 150
      t.text :description
      t.text :reason
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end
