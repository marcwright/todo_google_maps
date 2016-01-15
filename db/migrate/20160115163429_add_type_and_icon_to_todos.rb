class AddTypeAndIconToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :type, :string
    add_column :todos, :icon, :string
  end
end
