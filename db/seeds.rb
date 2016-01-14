# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Todo.destroy_all

Todo.create([
  {user_id: 2, title: "Get Lunch", assignee_id: 1},
  {user_id: 2, title: "Wash Car", assignee_id: 3}
  ])
