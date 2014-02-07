class AddSubRegionToWines < ActiveRecord::Migration
  def change
    add_column :wines, :sub_region, :string, after: :stored, default: nil
  end
end
