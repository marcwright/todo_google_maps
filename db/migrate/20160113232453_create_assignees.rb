class CreateAssignees < ActiveRecord::Migration
  def change
    create_table :assignees do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :phone

      t.timestamps null: false
    end
  end
end
