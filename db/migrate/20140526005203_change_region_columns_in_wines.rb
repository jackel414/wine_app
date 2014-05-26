class ChangeRegionColumnsInWines < ActiveRecord::Migration
  def change
  	rename_column :wines, :general_region, :province
  	rename_column :wines, :specific_region, :region
  	remove_column :wines, :micro_region
  end
end
