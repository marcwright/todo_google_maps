class AddAssigneeIdToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :assignee_id, :integer
  end
end
