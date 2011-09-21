class CreateProductionYearIssueJoinTable < ActiveRecord::Migration
  def self.up
    create_table :production_years_issues, :id => false do |t|
      t.integer :production_year_id
      t.integer :issue_id
    end
  end

  def self.down
    drop_table :production_years_issues
  end
end