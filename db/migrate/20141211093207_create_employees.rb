class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :company_name, limit: 150
      t.string :company_phone_number, limit: 16
      t.string :job, limit: 150
      t.integer :social_status_id

      t.timestamps
    end
  end
end
