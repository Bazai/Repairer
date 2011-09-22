class CreateProductionYears < ActiveRecord::Migration
  def self.up
    create_table :production_years do |t|
      t.integer :year
      t.references :car_model

      t.timestamps
    end
    add_index :production_years, :car_model_id
  end
  
  def self.down
    remove_index :production_years, :car_model_id
    drop_table :production_years
  end
end
