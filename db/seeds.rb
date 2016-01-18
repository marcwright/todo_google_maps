# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Assignee.destroy_all
Assignee.create([
    {name: "Marc", address: "477 Wilmer St NE", city: "Atlanta", state: "GA", what: "assignee"},
    {name: "Maren", address: "695 North Avenue NE", city: "Atlanta", state: "GA", what: "assignee"},
    {name: "Katy", address: " 725 Ponce De Leon Ave NE", city: "Atlanta", state: "GA", what: "assignee"}
   ])

Todo.destroy_all
Todo.create([
  {user_id: 1, business_name: "Chipotle", title: "Get Lunch @ Chipotle", assignee_id: 1, address: "718 Ponce de Leon Ave NE", city: "Atlanta", state: "GA", what: "todo"},
  {user_id: 1, business_name: "Krispy Kreme", title: "Get Krispy Cremes", assignee_id: 2, address: "295 Ponce De Leon Ave NE", city: "Atlanta", state: "GA", what: "todo"},
  {user_id: 1, business_name: "Barking Hound Lofts", title: "Pick up Diesel at Barking Hound", assignee_id: 3, address: "765 North Avenue NE", city: "Atlanta", state: "GA", what: "todo"}
  ])