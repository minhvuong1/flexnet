require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :home
end

get '/signup' do
  "signup page"
end

get '/login' do
  "login page login here"
end

get '/profile' do
  "profile page"
end

get '/:anything' do 
  "404 not found #{params[:anything]}"
end





