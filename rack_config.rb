require 'sequel'
require 'slim'
require 'pony'

require 'dotenv'
Dotenv.load

if ENV['RACK_ENV'] == 'production'
  DATABASE_PATH = ENV.fetch('DATABASE_URL')
else
  DATABASE_PATH = 'postgres://localhost/urwelcome_development'.freeze
end

Pony.options = {
      via: :smtp,
      via_options: {
        address: 'smtp.sendgrid.net',
        port: '587',
        domain: 'saberespoder.com',
        user_name: ENV['SENDGRID_USERNAME'],
        password: ENV['SENDGRID_PASSWORD'],
        authentication: :plain,
        enable_starttls_auto: true
      }
    }

DB = Sequel.connect(DATABASE_PATH)
Sequel::Model.plugin :uuid
Sequel::Model.plugin :timestamps, create: :created_at, update: :updated_at

if ENV['RACK_ENV'] == 'test'
  DB.drop_table(:members)
end

unless DB.table_exists?(:members)
  DB.create_table! :members do
    column :uuid, :uuid, primary_key: true
    column :name, String
    column :email, String
    column :created_at, DateTime
    column :updated_at, DateTime
  end
end

require_relative 'models/member'
