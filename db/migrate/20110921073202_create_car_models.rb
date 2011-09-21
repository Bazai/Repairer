class CreateCarModels < ActiveRecord::Migration
  def self.up
    create_table :car_models do |t|
      t.string :name
      t.string :description
      t.references :brand

      t.timestamps
    end
    add_index :car_models, :brand_id
  end
  
  def self.down
    remove_index :car_models, :brand_id
    drop_table :car_models
  end
end
