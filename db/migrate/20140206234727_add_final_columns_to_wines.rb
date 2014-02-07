class AddFinalColumnsToWines < ActiveRecord::Migration
  def change
    add_column :wines, :winery, :string
    add_column :wines, :vintage, :string
    add_column :wines, :location, :string
    add_column :wines, :type, :string
    add_column :wines, :price, :integer
    add_column :wines, :catalog, :boolean
    add_column :wines, :purchase_date, :string
    add_column :wines, :drink_date, :string
    add_column :wines, :with_meal, :boolean
    add_column :wines, :meal, :string
    add_column :wines, :notes, :string
    add_column :wines, :rating, :integer
    add_column :wines, :num_bottles, :integer
    add_column :wines, :abv, :float
  end
end
