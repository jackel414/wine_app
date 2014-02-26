class AddRegion2ToWines < ActiveRecord::Migration
  def change
    add_column :wines, :add_region_2, :string, after: :add_region, default: nil
  end
end
