class ChangePriceFormat < ActiveRecord::Migration
  def change
	change_column :wines, :price, :float
  end
end
