class ChangeRegionsColumnsInRegions < ActiveRecord::Migration
  def change
  	rename_column :regions, :region_1, :general_region
  	rename_column :regions, :region_2, :specific_region
  	rename_column :regions, :region_3, :mico_region
  end
end
