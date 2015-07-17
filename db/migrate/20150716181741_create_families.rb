class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name,         null: false
      t.string :phone_number, null: false
      t.string :address,      null: false
      t.string :picture

      t.timestamps null: false
    end
  end
end
