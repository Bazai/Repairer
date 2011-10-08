class AddMileageToMaintenance < ActiveRecord::Migration
  def change
    add_column :maintenances, :mileage, :integer
  end
end
