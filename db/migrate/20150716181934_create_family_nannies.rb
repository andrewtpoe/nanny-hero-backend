class CreateFamilyNannies < ActiveRecord::Migration
  def change
    create_table :family_nannies do |t|
      t.integer :family_id, null: false
      t.integer :nanny_id,  null: false

      t.timestamps null: false
    end

    add_index :family_nannies, :family_id
    add_index :family_nannies, :nanny_id
    add_index :family_nannies, [:family_id, :nanny_id], unique: true
  end
end
