# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
City.create([{name:'Montreal',state:'Quebec',country:'Canada'},{name:'Laval',state:'Quebec',country:'Canada'},{name:'Toronto',state:'Ontario',country:'Canada'}])
User.create([{username:'testing',email:'a@a.com',password:'test1234',password_confirmation:'test1234'},{username:'linux',email:'b@b.com',password:'linux1234',password_confirmation:'linux1234'}])



# Create categories
categories = [
  {name: "automobile"},
  {name: "book"},
  {name: "realestate"},
  {name: "electronic"},
  {name: "job"}
]

categories.each do |c|
  Category.create(c)
end
