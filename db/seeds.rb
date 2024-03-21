# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

########  Forma 1  ######################

    # puts "Destroying all users"
    # User.destroy_all
    # puts "Creating the users"
    # user = User.new(username: "testino", email:"testino@mail.com", first_name:"Testino", last_name:"Probino", birth_date:"1988-01-01")
    # user1 = User.new(username: "testino1", email:"testino1@mail.com", first_name:"Testino1", last_name:"Probino1", birth_date:"1988-01-02")
    # user2 = User.new(username: "testino2", email:"testino2@mail.com", first_name:"Testino2", last_name:"Probino2", birth_date:"1988-01-03")
    # if user.save && user1.save && user2.save
    #     puts "Creando el usuario satisfactoriamente"   
    # else
    #     p user.errors.full_messages.join(", ") #"Username  ya ha sido registrado , Email  ya ha sido registrado " Mira en app, en models y luego en user.rb lo de error con mensaje
    #     p user1.errors.full_messages.join(", ")
    #     p user2.errors.full_messages.join(", ")
    # end


########  Forma 2  ######################
    # puts "Destroying all users"
    # User.destroy_all
    # puts "Creating the users"
    # 10.times do |n|
    #     user = User.create(username: "testino#{n+1}", email:"testino#{n+1}@mail.com", first_name:"Testino#{n+1}", last_name:"Probino#{n+1}", birth_date:"1988-01-01")
    # end
    

########  Forma 3  ######################
require "faker"
puts "Destroying all users"
User.destroy_all
puts "Creating the users"
10.times do |n|
   first_name= Faker::Name.first_name
   user= User.create(
    username: Faker::Internet.unique.username(specifier: 6..11),
    email: Faker::Internet.unique.email(name: first_name, domain: "codeable.com"),
    first_name: first_name,
    last_name: Faker::Name.last_name,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 120)
    )
    # if user.persisted?
    #     puts "Usario creado"
    # else
    #     puts user.errors.full_messages.join(", ")
    #     p user
    # end
    unless user.persisted?
        puts user.errors.full_messages.join(", ")
        p user   
    end
end
puts "Finishing creating the users"