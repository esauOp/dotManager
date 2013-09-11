# Para Rails 4 se agrega este archivo para cargar /lib
Dir["#{Rails.root}/lib/*.rb"].each {|file| load file}
