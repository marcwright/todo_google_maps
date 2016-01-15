class AddWhatToAssignees < ActiveRecord::Migration
  def change
    add_column :assignees, :what, :string
  end
end
