# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = Usuario.create([{ name: 'Admin', last_name: 'Group', email: 'admin@dom.com', password: 'password', password_confirmation: 'password', role: 1, admin: true  }])
#user = Usuario.create! :email => 'admin@dom.com', :password => 'password', :password_confirmation => 'password', :role => '1'
puts 'New user created: '