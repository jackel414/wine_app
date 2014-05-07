class ChangeRoleDefaultUsers2 < ActiveRecord::Migration
  def change
    change_column_default :users, :role, 'User'
  end
end
