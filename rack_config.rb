require 'sequel'
require 'sprockets'
require 'uglifier'
require 'sass'
require 'slim'

if ENV['RACK_ENV'] == 'production'
  DATABASE_PATH = ENV.fetch('DATABASE_URL')
else
  DATABASE_PATH = 'postgres://localhost/drpepper_development'.freeze
end

DB = Sequel.connect(DATABASE_PATH)
