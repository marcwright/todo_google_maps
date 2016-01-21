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
      todo_coords_array << {"lat" => todo.latitude, "lng" => todo.longitude, "name" => todo.title, "what" => todo.what, "business_name" => todo.business_name, "img_url" => (Assignee.find(todo.assignee_id)).img_url, "completed" => todo.completed }      
    end
    
    todo_coords_array
  end

def send_sms(assignee_id_name, completed)
  account_sid = ENV["TWILIO_ACCOUNT_SID"]
  auth_token = ENV["TWILIO_AUTH_TOKEN"]
  client = Twilio::REST::Client.new account_sid, auth_token
   
  from = "+12056701332" # Your Twilio number
   
  friends = {
    "+12054051042" => "Marc"
    # "+19512859866" => "Maren"
  }
  
  message1 = "by #{ self.due_date } I need you to please... #{ self.title }. Please text 'D' when done. Thx!"
  message2 = "Thank you for #{ self.title }, see you soon!!"

  friends.each do |key, value|
    client.account.messages.create(
      :from => from,
      :to => key,
      :body => "Hey #{ assignee_id_name.name }, #{ (completed == true) ? message2 : message1 }"
    )
    puts "Sent message to #{ value }"
  end
end

def self.get_sms
  account_sid = ENV["TWILIO_ACCOUNT_SID"]
  auth_token = ENV["TWILIO_AUTH_TOKEN"]
  client = Twilio::REST::Client.new account_sid, auth_token
   
  # Get an object from its sid. If you do not have a sid,
  # check out the list resource examples on this page
  # message = client.account.messages.get("SMc34f161d6b5ef453fce9a957ec5e2288")
  # client.account.messages.list.each do |message|
  #   puts message.date_sent
  # end

  message = client.account.messages.list[4]
  puts message.body
  t = Todo.last
  
  if message.body == 'D'
    t.update_attributes(completed: true)
  end
end


  private

  def default_values
    self.completed ||= false
    nil                           # required so that TX will not rollback!!!
  end
end