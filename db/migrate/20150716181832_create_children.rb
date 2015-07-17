class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name,           null: false
      t.string :age
      t.string :allergies
      t.string :fav_food
      t.string :interests
      t.string :bed_time
      t.string :potty_trained
      t.string :special_needs
      t.integer :family_id,     null: false

      t.timestamps null: false
    end

    add_index :children, :family_id
  end
end
