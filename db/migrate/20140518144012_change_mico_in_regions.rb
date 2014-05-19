class ChangeMicoInRegions < ActiveRecord::Migration
  def change
  	rename_column :wines, :mico_region, :micro_region
  end
end
