class AddAddressFieldsToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :business_name, :string
    add_column :todos, :street, :string
    add_column :todos, :city, :string
    add_column :todos, :state, :string
    add_column :todos, :zip, :integer
  end
end
