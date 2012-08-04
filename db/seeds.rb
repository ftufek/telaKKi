# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
City.create([{name:'Montreal',state:'Quebec',country:'Canada'},{name:'Laval',state:'Quebec',country:'Canada'},{name:'Toronto',state:'Ontario',country:'Canada'}])
User.create([{username:'test',email:'a@a.com',password:'test',password_confirmation:'test'},{username:'linux',email:'b@b.com',password:'linux',password_confirmation:'linux'}])
