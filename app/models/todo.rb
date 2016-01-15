class Todo < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignee
  validates :title, presence: true

  before_save :default_values

  geocoded_by :address
  after_validation :geocode

  def self.get_todo_coords
    todos = Todo.all

    todo_coords_array = []

    todos.each do |todo|
      todo_coords_array << {"lat" => todo.latitude, "lng" => todo.longitude, "name" => todo.title, "what" => todo.what}      
    end
    
    todo_coords_array
  end




  private

  def default_values
    self.completed ||= false
    nil                           # required so that TX will not rollback!!!
  end
end