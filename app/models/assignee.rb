class Assignee < ActiveRecord::Base
  has_many :users, through: :todos
  has_many :todos

  geocoded_by :address
  after_validation :geocode


  def self.get_assignee_coords
    assignees = Assignee.all

    assignee_coords_array = []

    assignees.each do |assignee|
      assignee_coords_array << {"lat" => assignee.latitude, "lng" => assignee.longitude, "name" => assignee.name, "what" => assignee.what, "assignee_img_url" => assignee.img_url}      
    end
    
    assignee_coords_array
  end

end
