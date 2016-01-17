require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

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

def send_sms(assignee_id_name)
  account_sid = "ACd0fe6ab58f7a1dfd036c079a005b1690"
  auth_token = "47db4a524c214b92162d904b06eb2736"
  client = Twilio::REST::Client.new account_sid, auth_token
   
  from = "+12056701332" # Your Twilio number
   
  friends = {
    "+12054051042" => "Marc"
    # "+19512859866" => "Maren"
  }
  friends.each do |key, value|
    client.account.messages.create(
      :from => from,
      :to => key,
      :body => "Hey #{assignee_id_name.name}, by #{self.due_date} I need you to please... #{ self.title }. Please text 'D' when done. Thx!"
    )
    puts "Sent message to #{value}"
  end
end


  private

  def default_values
    self.completed ||= false
    nil                           # required so that TX will not rollback!!!
  end
end