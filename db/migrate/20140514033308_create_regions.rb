class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :country
      t.string :region_1
      t.string :region_2
      t.string :region_3
    end
  end
end
