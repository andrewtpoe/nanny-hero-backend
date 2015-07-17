class CreateNannies < ActiveRecord::Migration
  def change
    create_table :nannies do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
