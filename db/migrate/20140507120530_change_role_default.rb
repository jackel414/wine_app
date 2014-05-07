class ChangeRoleDefault < ActiveRecord::Migration
  def change
    change_column_default :users, :role, default: "User"
  end
end
