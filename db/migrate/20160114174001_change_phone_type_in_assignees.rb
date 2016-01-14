class ChangePhoneTypeInAssignees < ActiveRecord::Migration
  def change
    change_column :assignees, :phone, :string
  end
end
