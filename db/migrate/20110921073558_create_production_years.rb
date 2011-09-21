class CreateProductionYears < ActiveRecord::Migration
  def self.up
    create_table :production_years do |t|
      t.integer :year
      t.references :carmodel

      t.timestamps
    end
    add_index :production_years, :carmodel_id
  end
  
  def self.down
    remove_index :production_years, :carmodel_id
    drop_table :production_years
  end
end
