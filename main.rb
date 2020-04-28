require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :home
end

get '/signup' do
  erb :signup
end

get '/login' do
  erb :login
end

get '/profile' do
  erb :profile
end

get '/:anything' do 
  "404 not found #{params[:anything]}"
end





