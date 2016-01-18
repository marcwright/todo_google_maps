class AddImgUrlToAssignees < ActiveRecord::Migration
  def change
    add_column :assignees, :img_url, :string
  end
end
