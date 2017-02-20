require 'sinatra/base'
require 'slim'

class URWelcome < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :public_folder, 'public'

  get '/' do
    slim :index
  end

  post '/signup' do
    puts params
    Member.create(name: params[:name], email: params[:email])
    200
  end

  get '/images/:file' do
    send_file('./public/assets/images/'+params[:file], :disposition => 'inline')
  end

  get '/assets/stylesheets/:file' do
    send_file('./public/assets/stylesheets'+params[:file], :disposition => 'inline')
  end

  get '/assets/javascripts/:file' do
    send_file('./public/assets/javascripts'+params[:file], :disposition => 'inline')
  end
end
