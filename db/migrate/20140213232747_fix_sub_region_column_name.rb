class FixSubRegionColumnName < ActiveRecord::Migration
  def change
	rename_column :wines, :sub_region, :add_region
  end
end
