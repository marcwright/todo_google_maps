class ChangeTypeInTodos < ActiveRecord::Migration
  def change
    rename_column :todos, :type, :what
  end
end
