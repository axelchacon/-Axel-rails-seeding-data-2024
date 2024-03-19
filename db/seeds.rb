# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Hello From seeds"
user = User.new(username: "testino", email:"testino@mail.com", first_name:"Testino", last_name:"Probino", birth_date:"1988-01-01")
if user.save
    puts "Creando el usuario satisfactoriamente"   
else
    p user.errors.full_messages.join(", ") #"Username  ya ha sido registrado , Email  ya ha sido registrado " Mira en app, en models y luego en user.rb lo de error con mensaje
end