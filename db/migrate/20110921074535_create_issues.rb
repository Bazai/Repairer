class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do |t|
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
  
  def self.down
    drop_table :issues
  end
end
