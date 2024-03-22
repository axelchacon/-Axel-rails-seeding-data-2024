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
require "json"
puts "Destroying all data"
#Borrar las tablas intermedias siquieres que corra bien el rails db:seed sino te va a salir error
Critic.destroy_all
#Borrar  tablas independientes
Game.destroy_all
User.destroy_all

puts "Users: Creating the users"
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
puts "Users: Finishing creating the users"

puts "Game:  creating the Game"
#Leer el archivo File.read
#parserar el archivo a objeto de Ruby con JSON.parse
game_data = JSON.parse(File.read("db/games.json"), symbolize_names: true)
    # p game_data
#Recorriendo cada uno de los registros
game_data.each do |game_data|
    #Crear el juego
    game = Game.create(game_data) #aprovechando que el archivo punto JSON tiene el los parámetros de hashes igual  a las columnas de la data Game por lo que se vuelve más fácil crearlos
    unless game.persisted?
        puts game.errors.full_messages.join(", ")
        p game   
    end
end
puts "Game: Finishing creating the Game"

puts "Critics: Starting creating the Critics"
    games = Game.all
    games.each do |game|
        users = User.all.to_a
        rand(1..3).times  do #rand(1..3).times {puts "Times"} , imprime de manera random 2 veces times y poene el número 2
            user = users.sample # evitamos que un usuario haga 2  a más críticas a u mismo juego, a que la critica es unica
            critic = Critic.new
            critic.title = Faker::Lorem.sentence(word_count: 3)
            critic.body =  Faker::Lorem.paragraph
            critic.game_id= game.id # es game porque ya lo estamos llamando destro del each
            critic.user_id= user.id # es user porque tenenemos que crear la llamada dentro del each
            users.delete(user) # evitamos que un usuario haga 2  a más críticas a u mismo juego, a que la critica es unica
            critic.save # evitamos que un usuario haga 2  a más críticas a u mismo juego, a que la critica es unica
            unless critic.persisted?
                puts critic.errors.full_messages.join(", ")
                p critic   
            end
        end
    end
puts "Critics: Finishing creating the Critics"
# users =User.all #[{user:1, user:2, user:3}]
# user = users.sample # user:2
# users.delete(user) # [{user:1, user:2, user:3}].delete({user:2})
# # users = [{user:1, user:3}]