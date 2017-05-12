# Create a SQLite3 db file from a SQL structure file.
require "yaml"
require "active_record"

if $0 == $PROGRAM_NAME
  include ActiveRecord::Tasks

  file = "./config/database.yml"
  config = YAML.load_file(file)

  # use second key in config hash
  # database.yml

  # default: &default
  #   adapter:  sqlite3
  #   encoding: unicode

  # development:
  #   <<: *default
  #   database: db/development.sqlite3
 
  master_key = config.keys[1]

  # get the database from the database key in config hash
  database = config.fetch(master_key).fetch('database')

  unless File.exist?(database)
    @sldbtask = SQLiteDatabaseTasks.new(config.fetch(master_key), './')
    @sldbtask.create  
    @sldbtask.structure_load('./db/any.sql')
  end 

  # optional if you have sqlitebrowser
  # system 'sqlitebrowser db/development.sqlite3'

  @sldbtask = SQLiteDatabaseTasks.new(config.fetch(master_key), '/')
  @sldbtask.establish_connection(config.fetch(master_key))

  for schema_migrations in ActiveRecord::Schema.tables.to_a

    p @modelname=schema_migrations.titleize.split.join

    p eval "class #{@modelname} < ActiveRecord::Base; self.table_name='#{schema_migrations}'; end"

  end
end

=begin


You don't need a Rails app to use this but just a sql structure file. I set up a file structure very similar to Rails.
/config
database.yml
/db
structure.sql

You may write your own sql structure or barrow one from a Rails app.

simple example:
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");

Then you should be able to use migrations also but that code is not included here.
Have fun!
For more info on this discussion see:
http://guides.rubyonrails.org/active_record_migrations.html
http://api.rubyonrails.org/classes/ActiveRecord/Schema.html

and perhaps
http://sequel.jeremyevans.net/documentation.html

I think what inspired this is camping.gem example. We had no database to hook up to.
=end

#"Create model from tables in database"

# Add this:

for tabla in ActiveRecord::Schema.tables.to_a

   @modelname=table.titleize.split.join

   eval "class #{@modelname} < ActiveRecord::Base; self.table_name='#{tabla}'; end"

 end

# 20150203110000_create_widgets.rb
class CreateWidgets < ActiveRecord::Migration
    def create
       create_table :widgets do |t|
           t.string   :name
           t.text     :description
           t.integer  :stock

           t.timestamps
      end
   end
end



# From Active Records Models

class Product < ActiveRecord::Base
end

CREATE TABLE products (
   id int(11) NOT NULL auto_increment,
   name varchar(255),
   PRIMARY KEY  (id)
);

p = Product.new
p.name = "Some Book"
puts p.name # "Some Book"



# From Active Record Overriding the Naming Conventions

class Product < ActiveRecord::Base
  self.table_name = "PRODUCT"
end

class FunnyJoke < ActiveSupport::TestCase
  set_fixture_class funny_jokes: 'Joke'
  fixtures :funny_jokes
  ...
end

class Product < ActiveRecord::Base
  set_primary_key "product_id"
end



# From CRUD: Reading and Writing Data

# Create

user = User.create(name: "David", occupation: "Code Artist")

user = User.new
user.name = "David"
user.occupation = "Code Artist"

user = User.new do |u|
  u.name = "David"
  u.occupation = "Code Artist"
end

Read


# return a collection with all users
users = User.all

# return the first user
user = User.first

# return the first user named David
david = User.find_by_name('David')

# find all users named David who are Code Artists and sort by created_at in reverse chronological order
users = User.where(name: 'David', occupation: 'Code Artist').order('created_at DESC')

# Update

user = User.find_by_name('David')
user.name = 'Dave'
user.save

user = User.find_by_name('David')
user.update(name: 'Dave')

User.update_all "max_login_attempts = 3, must_change_password = 'true'"

# Delete

user = User.find_by_name('David')
user.destroy

# https://myrackapps.herokuapp.com/htdocs/Rails-guides-md/active_record_querying.html

# From Validations

class User < ActiveRecord::Base
  validates :name, presence: true
end

User.create  # => false
User.create! # => ActiveRecord::RecordInvalid: Validation failed: Name can't be blank



# From Migrations

class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.text :description
      t.references :publication_type
      t.integer :publisher_id
      t.string :publisher_type
      t.boolean :single_issue

      t.timestamps
    end
    add_index :publications, :publication_type_id
  end
end

# https://myrackapps.herokuapp.com/htdocs/Rails-guides-md/migrations.html

