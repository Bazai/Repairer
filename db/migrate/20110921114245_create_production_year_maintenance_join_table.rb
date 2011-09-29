class CreateProductionYearMaintenanceJoinTable < ActiveRecord::Migration
  def self.up
    create_table :production_years_maintenances, :id => false do |t|
      t.integer :production_year_id
      t.integer :maintenance_id
    end
  end

  def self.down
    drop_table :production_years_maintenances
  end
end