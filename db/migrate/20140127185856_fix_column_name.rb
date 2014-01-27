class FixColumnName < ActiveRecord::Migration
  def change
	rename_column :wines, :string, :country
  end
end
