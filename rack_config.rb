require 'sequel'
require 'slim'

if ENV['RACK_ENV'] == 'production'
  DATABASE_PATH = ENV.fetch('DATABASE_URL')
else
  DATABASE_PATH = 'postgres://localhost/urwelcome_development'.freeze
end

DB = Sequel.connect(DATABASE_PATH)
