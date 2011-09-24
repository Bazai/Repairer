class AddProductionYearIdToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :production_year_id, :integer
  end
  
  def self.down
    remove_column :issues, :production_year_id
  end
end