class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.string :grapes
      t.string :region
      t.string :string
      t.boolean :stored

      t.timestamps
    end
  end
end
