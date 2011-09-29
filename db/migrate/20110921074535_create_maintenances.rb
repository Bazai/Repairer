class CreateMaintenances < ActiveRecord::Migration
  def self.up
    create_table :maintenances do |t|
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
  
  def self.down
    drop_table :maintenances
  end
end
