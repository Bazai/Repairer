class CreateCars < ActiveRecord::Migration
  def self.up
    create_table :cars do |t|
      t.string :name
      t.references :brand

      t.timestamps
    end
    add_index :cars, :brand_id
  end
  
  def self.down
    remove_index :cars, :brand_id
    drop_table :cars
  end
  
end