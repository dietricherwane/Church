class CreateDevoteds < ActiveRecord::Migration
  def change
    create_table :devoteds do |t|
      t.string :firstname, limit: 150
      t.string :lastname, limit: 150
      t.string :phone_number, limit: 16
      t.string :mobile_number, limit: 16
      t.date :birthdate
      t.string :birthplace, limit: 150
      t.string :address, limit: 150
      t.integer :tribe_id
      t.string :identity_card_number
      t.integer :status_id
      t.integer :marital_status_id
      t.integer :social_status_id
      t.boolean :baptised
      t.boolean :published

      t.timestamps
    end
  end
end
