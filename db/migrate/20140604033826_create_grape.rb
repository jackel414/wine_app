class CreateGrape < ActiveRecord::Migration
  def change
    create_table :grapes do |t|
      t.string :name
    end
  end
end