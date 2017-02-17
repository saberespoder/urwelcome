require 'sinatra/base'
require 'sprockets'
require 'uglifier'
require 'sass'
require 'slim'

class URWelcome < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :public_folder, 'public'
  #set :environment, Sprockets::Environment.new
  #environment.js_compressor  = :uglify
  #environment.css_compressor = :scss
  #environment.append_path "./assets/stylesheets"
  #environment.append_path "./assets/javascripts"
  #environment.append_path "./assets/fonts"
  #environment.append_path "./assets/images"

  get '/' do
    slim :index
  end

  get '/images/:file' do
    send_file('./public/assets/images/'+params[:file], :disposition => 'inline')
  end

  get '/assets/:file' do
    send_file('./public/assets/'+params[:file], :disposition => 'inline')
  end
end
