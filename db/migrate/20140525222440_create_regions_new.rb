class CreateRegionsNew < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.integer :country_id
      t.integer :province_id
    end
  end
end
