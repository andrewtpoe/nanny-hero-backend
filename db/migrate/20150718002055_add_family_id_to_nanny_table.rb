class AddFamilyIdToNannyTable < ActiveRecord::Migration
  def change
    add_column :families, :nanny_id, :integer, null: false
  end
end
