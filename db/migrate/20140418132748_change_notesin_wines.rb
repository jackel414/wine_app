class ChangeNotesinWines < ActiveRecord::Migration
  def change
    change_column :wines, :notes, :text
  end
end
