class RenameIssuesToMaintenance < ActiveRecord::Migration
  def change
    rename_table :issues, :maintenances
  end
end
