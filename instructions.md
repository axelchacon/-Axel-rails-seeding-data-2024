# Critics - Basic models

## **Introduction:**

One idea struck you like a thunderbolt in the middle of the night. A brand new
open-source video-game review platform called "Critics". The idea seems
revolutionary to you but you need to start with the basics. Quickly you drew a
basic ERD: A collection of Games that could receive some critics:

You want to build a Rails application around your idea. The first step would be
to create the **Models**. You jump to the
[Rails Guides](https://guides.rubyonrails.org/index.html) looking for answers.

---

First, read the following 3 sections of the guides:

- [1 What is Active Record?](https://guides.rubyonrails.org/active_record_basics.html#what-is-active-record-questionmark)
- [2 Convention over Configuration in Active Record](https://guides.rubyonrails.org/active_record_basics.html#convention-over-configuration-in-active-record)
- [3 Creating Active Record Models](https://guides.rubyonrails.org/active_record_basics.html#creating-active-record-models)

### Task 1: Creating the Game model

Before creating any model you will need a database and a table to be mapped to.
To create a new database for your Rails application just run:

```bash
$ rails db:create
Created database 'rails-basic-models_development'
Created database 'rails-basic-models_test'
```

<aside>
💡 You can use `rails db:drop` to delete the databases as well.
</aside>

By default, Rails creates 2 databases: `app_name_development` y `app_name_test`.
This doesn't change anything in your project (you can run git status to be
sure). Only creates the DBs interacting with your DBMS (PostgreSQL).

If you enter your DBMS client (psql or PGAdmin) you will find the new databases created.

```
$ psql -d postgres
psql (14.1)
Type "help" for help.

postgres=# \list

List of databases
              Name         |  Owner         | Encoding |   Collate   |    Ctype    |   Access privileges   
---------------------------+----------------+----------+-------------+-------------+-----------------------
rails-models_development   | [your_user]    | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
rails-models_test          | [your_user]    | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
```

To create the table `games` on your database you will need a `Migration`.
Luckily the `model generator` creates the migration alongside the model file for
you. The command to execute a model generator looks like this:

```bash
$ rails generate model ModelNameInSingular column:data_type column:data_type ...
```

Try to use the model generator to create the Game model. 

If you generate the model correctly, a migration file should be created. It
should be similar to:

```ruby
# 20201209083333_create_games.rb

class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :genre
      t.integer :price
      t.date :release_date

      t.timestamps
    end
  end
end
```

Run the migration to make the changes on the database:

```ruby
$ rails db:migrate
```

You should be ready now. To check if your model is working you can run some
queries (like `Game.all`) inside the Rails Console:

```ruby
$ rails console
Loading development environment (Rails 7.0.1)
irb(main):001:0> Game.all
  Game Load (0.5ms)  SELECT "games".* FROM "games" LIMIT $1  [["LIMIT", 11]]
=> #<ActiveRecord::Relation []>
irb(main):002:0>
```

If you see the SQL query running and the response is
`#<ActiveRecord::Relation []>`, everything is right!.

> This is a good moment to commit your changes. Maybe with "Create Game model"

---

### Perform CRUD operations

Jump to this section of the guide and read about how to **C**reate, **R**ead,
**U**pdate and **D**elete records using ActiveRecord. Then complete the
remaining **Tasks**.

- [**5 CRUD: Reading and Writing Data**](https://guides.rubyonrails.org/active_record_basics.html#crud-reading-and-writing-data)

<aside> 💡 The following tasks don't need to be committed to git (actually they
can't) because they are only interactions with your local database. </aside>

### Task 2: Create Game records

Enter to the Rails console and do the following

- Using the `create` method, create a Game with:
    - name: Rune Factory 4 Special
    - genre: Role-playing (RPG)
    - price: 5999
    - release_date: 2019-07-25
- Using the `new` and `save` methods, create a Game with:
    - name: Borderlands 3
    - genre: Simulator
    - price: 5999
    - release_date: 2019-09-13
- Use this array of games to `create` the records on your database:

```
[ {:name=>"Zombie Driver: Immortal Edition", :genre=>"Racing", :price=>5999, :release_date=>"2019-Jul-25"},
{:name=>"Remnant: From the Ashes", :genre=>"Shooter", :price=>6999, :release_date=>"2019-Aug-20"},
{:name=>"Monster Hunter: World - Iceborne", :genre=>"Adventure", :price=>6999, :release_date=>"2019-Sep-06"},
{:name=>"Cyberpunk 2077", :genre=>"Role-playing (RPG)", :price=>4999, :release_date=>"2020-Sep-17"},
{:name=>"Pokémon Shield", :genre=>"Role-playing (RPG)", :price=>5999, :release_date=>"2019-Nov-15"},
{:name=>"Children of Morta", :genre=>"Role-playing (RPG)", :price=>6999, :release_date=>"2019-Sep-03"} ]
```

<aside> 💡 Tip: Iterate through the array and for `each` game call `Game.create`
passing it the game. Since the hash is correctly formatted you shouldn't have
any problem. </aside>

---

### **Task 3: Accessing Game data**

Using your Rails console execute the right command to:

- Get `All` the games.
- `Find` the game with id 4
- Find the game that was released on "2019-Aug-20"
- Get the `first` game
- Get the `last` game
- Get all the games `sorted` by release date (from newest to oldest)
- Get all the games that cost $59.99 (5999 cents)
- Get all the games released on 2019 (google-search "extract year on
  ActiveRecord" 👀)

---

### **Task 4: Updating Game data**

- `Find` the game named "Borderlands 3" and save it on a variable. Then, set
  their `genre` attribute to "Shooter". Finally, `save` the updated record.
- `Find` the game "Pokémon Shield" and use the method `update` to change it
  price to 3999.
- `Update all` the "Role-playing (RPG)" games to have a price of 2999. (first
  you need to select the games you want to update 👀).

---

### **Task 5: Deleting Game records**

- `Find` the record with id 3 and `destroy` it.
- `Destroy` all the records of the genre "Adventure"
- Thinking again, `destroy_all` the games 😵
