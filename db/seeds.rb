# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'SETTING UP DEFAULT USER LOGIN'
user = Usuario.create([{ name: 'Admin', last_name: 'Group', email: 'admin@dom.com', password: 'password', password_confirmation: 'password', role: 1, admin: true  }])
puts 'Admin user created'
#user = Usuario.create! :email => 'admin@dom.com', :password => 'password', :password_confirmation => 'password', :role => '1'

# task_categorias = [
#   [ "Germany", 81831000 ],
#   [ "France", 65447374 ],
#   [ "Belgium", 10839905 ],
#   [ "Netherlands", 16680000 ]
# ]

# task_categorias.each do |name, population|
#   Country.create( name: name, population: population )
# end

task_categorias = [
   'Bug',
   'Design',
   'Development'
]

task_categorias.each do |name|
	puts name
  TaskCat.create([{ name: name }])
end

equipos = [
	['Desarrollo', 'Desarrollo de Aplicaciones Web/App.'],
	['Diseño', 'Diseño grafico y UX.']
]

equipos.each do |name, desc|
	Team.create([{name: name, description: desc}])
end


task_statuses = [
   'Closed',
   'Completed',
   'In Progress',
   'New'
]

task_statuses.each do |name|
	puts name
  TaskStatus.create([{ name: name }])
end


task_priorities = [
   'High',
   'Normal',
   'Low'
]

task_priorities.each do |name|
	puts name
  TaskPriority.create([{ name: name }])
end
