class Assignee < ActiveRecord::Base
  has_many :users, through: :todos
  has_many :todos

  geocoded_by :address
  after_validation :geocode


  def self.get_assignee_coords
    assignees = Assignee.all

    assignee_coords_array = []

    assignees.each do |assignee|
      # street = assignee.address.gsub(' ', '+')
      # city   = assignee.city.gsub(' ', '+')
      # state  = assignee.state
      name   = assignee.name
      what   = assignee.what
      assignee_lat = assignee.latitude
      assignee_lon = assignee.longitude

      # data = HTTParty.get "https://maps.googleapis.com/maps/api/geocode/json?address=#{street},+#{city},+#{state}&key=AIzaSyBMxa7ucqwX08z6wLjiuAj_YdCtTnXjWYY"

      # assignee_lon = data["results"][0]["geometry"]["location"]["lng"]
      # assignee_lat = data["results"][0]["geometry"]["location"]["lat"]

      assignee_coords_array << {"lat" => assignee_lat, "lng" => assignee_lon, "name" => name, "what" => what}      
    end
    
    assignee_coords_array
  end

end
