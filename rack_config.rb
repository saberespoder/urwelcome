require 'sequel'
require 'slim'

if ENV['RACK_ENV'] == 'production'
  DATABASE_PATH = ENV.fetch('DATABASE_URL')
else
  DATABASE_PATH = 'postgres://localhost/urwelcome_development'.freeze
end

DB = Sequel.connect(DATABASE_PATH)
Sequel::Model.plugin :uuid

unless DB.table_exists?(:members)
  DB.create_table! :members do
    column :uuid, :uuid, primary_key: true
    column :name, String
    column :email, String
  end
end

require_relative 'models/member'
