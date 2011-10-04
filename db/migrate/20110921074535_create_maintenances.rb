class CreateMaintenances < ActiveRecord::Migration
  def self.up
    create_table :maintenances do |t|
      t.string :description
      t.integer :price
      t.references :production_year

      t.timestamps
    end
    add_index :maintenances, :production_year_id
  end

  def self.down
    remove_index :maintenances, :production_year_id
    drop_table :maintenances
  end
end
