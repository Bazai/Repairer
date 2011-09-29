class AddProductionYearIdToMaintenance < ActiveRecord::Migration
  def change
    add_column :maintenances, :production_year_id, :integer
  end
  
  def self.down
    remove_column :maintenances, :production_year_id
  end
end