class Assignee < ActiveRecord::Base
  has_many :users, through: :todos
  has_many :todos
end
