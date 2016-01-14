class AddUserRefToAssignees < ActiveRecord::Migration
  def change
    add_reference :assignees, :user, index: true, foreign_key: true
  end
end
