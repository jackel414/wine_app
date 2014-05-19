class ChangeMicoInWines < ActiveRecord::Migration
  def change
  	rename_column :regions, :mico_region, :micro_region
  end
end
