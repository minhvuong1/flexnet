require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'

require_relative 'models/user'

enable :sessions 

def logged_in?
  !!session[:user_email]
end

def titleize(str) 
  str.gsub(/\w+/, &:capitalize)
end

get '/' do
  if logged_in?
    erb :home
  else
    redirect '/login'
  end
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
    redirect '/profile'
  else
    erb :login
  end
end

delete '/logout' do
  session[:user_email] = nil
  redirect '/login'
end

get '/profile' do
  if logged_in?
    erb :profile
  else 
    redirect '/login'
  end
end

get '/edit' do
  erb :edit_post_page
end

patch '/edit' do
  update_user(params["username"], params["name"], params["bio"], params["image_url"], params["id"])
  redirect '/profile'
end


get '/:anything' do 
  "404 not found #{params[:anything]}"
end






