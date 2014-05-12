class AddCatalogDateToWines < ActiveRecord::Migration
  def change
    add_column :wines, :catalog_date, :datetime
  end
end
