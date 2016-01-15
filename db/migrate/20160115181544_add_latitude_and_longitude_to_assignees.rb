class AddLatitudeAndLongitudeToAssignees < ActiveRecord::Migration
  def change
    add_column :assignees, :latitude, :float
    add_column :assignees, :longitude, :float
  end
end
