class Assignee < ActiveRecord::Base
  has_many :users, through: :todos
  has_many :todos

  def self.get_coords
    assignees = Assignee.all

    coords = []

    url = 'https://maps.googleapis.com/maps/api/geocode/json?address=#{street},+#{city},+#{state}&key=AIzaSyBMxa7ucqwX08z6wLjiuAj_YdCtTnXjWYY'

    assignees.each do |assignee|
      street = assignee.address.gsub(' ', '+')
      city   = assignee.city.gsub(' ', '+')
      state  = assignee.state

      data = HTTParty.get "https://maps.googleapis.com/maps/api/geocode/json?address=#{street},+#{city},+#{state}&key=AIzaSyBMxa7ucqwX08z6wLjiuAj_YdCtTnXjWYY"

      ass_lon = data["results"][0]["geometry"]["location"]["lng"]
      ass_lat = data["results"][0]["geometry"]["location"]["lat"]

      coords << [ass_lat, ass_lon]
      
    end
    coords
  end

end
