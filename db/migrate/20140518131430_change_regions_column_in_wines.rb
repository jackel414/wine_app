class ChangeRegionsColumnInWines < ActiveRecord::Migration
  def change
  	rename_column :wines, :region, :general_region
  	rename_column :wines, :add_region, :specific_region
  	rename_column :wines, :add_region_2, :mico_region
  end
end
