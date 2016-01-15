class AddLatitudeAndLongitudeToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :latitude, :float
    add_column :todos, :longitude, :float
  end
end
