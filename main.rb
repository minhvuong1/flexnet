require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'

require_relative 'models/user'

enable :sessions 

get '/' do
  erb :home
end

get '/signup' do
  erb :signup
end

post '/signup' do
  add_user(params["email"], params["name"], params["username"], params["password"])

  redirect '/login'
end

get '/login' do
  erb :login
end

post '/login' do
  user = find_one_user_by_email(params["email"])
  if user && BCrypt::Password.new(user["password_digest"]) == params["password"]
    session[:user_email] = user['email']
    redirect '/'
  else
    erb :login
  end
end

get '/profile' do
  erb :profile
end

get '/:anything' do 
  "404 not found #{params[:anything]}"
end





