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
simple example of the structure.sql file contents:
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");

An example migration file.
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
=end
