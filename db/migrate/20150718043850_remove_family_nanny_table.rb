class RemoveFamilyNannyTable < ActiveRecord::Migration
  def change
    drop_table :family_nannies
  end
end
