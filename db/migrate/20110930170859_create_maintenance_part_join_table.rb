class CreateMaintenancePartJoinTable < ActiveRecord::Migration
  def self.up
    create_table :maintenances_parts, :id => false do |t|
      t.integer :maintenance_id
      t.integer :part_id
    end
  end

  def self.down
    drop_table :maintenances_parts
  end
end
