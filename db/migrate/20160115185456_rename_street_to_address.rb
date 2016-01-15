class RenameStreetToAddress < ActiveRecord::Migration
  def change
    rename_column :todos, :street, :address
  end
end
