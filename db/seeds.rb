# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new(name: "Diana Ortiz", email: "diana@hotmail.com")
user.password = "1234"
user.save!

url = Url.create(long_url: 'https://www.youtube.com/watch?v=CJinWua98NA', short_url: 'nuy89BG6')
user.urls << url