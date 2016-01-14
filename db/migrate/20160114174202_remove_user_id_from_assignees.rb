class RemoveUserIdFromAssignees < ActiveRecord::Migration
  def change
    remove_column :assignees, :user_id
  end
end
