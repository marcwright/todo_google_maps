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
      # address = todo.address.gsub(' ', '+')
      # city   = todo.city.gsub(' ', '+')
      # state  = todo.state
      title  = todo.title
      what   = todo.what
      todo_lat = todo.latitude
      todo_lon = todo.longitude

      # data = HTTParty.get "https://maps.googleapis.com/maps/api/geocode/json?address=#{address},+#{city},+#{state}&key=AIzaSyBMxa7ucqwX08z6wLjiuAj_YdCtTnXjWYY"

      # todo_lon = data["results"][0]["geometry"]["location"]["lng"]
      # todo_lat = data["results"][0]["geometry"]["location"]["lat"]

      todo_coords_array << {"lat" => todo_lat, "lng" => todo_lon, "name" => title, "what" => what}      
    end
    
    todo_coords_array
  end




  private

  def default_values
    self.completed ||= false
    nil                           # required so that TX will not rollback!!!
  end
end