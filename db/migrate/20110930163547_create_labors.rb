class CreateLabors < ActiveRecord::Migration
  def change
    create_table :labors do |t|
      t.string :name
      t.string :description
      t.references :maintenance

      t.timestamps
    end
  end
end
