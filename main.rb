require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'

require_relative 'models/users'
require_relative 'models/posts'

enable :sessions 

def logged_in?
  !!session[:user_email]
end

def titleize(str) 
  str.gsub(/\w+/, &:capitalize)
end

get '/' do
  if logged_in?
    posts = all_posts()
    erb(:home, locals: {
    posts: posts
    })
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
  erb :edit_profile_page
end

patch '/edit' do
  update_user(params["username"], params["name"], params["bio"], params["image_url"], params["id"])
  redirect '/profile'
end

get '/new_post' do
  posts = all_posts()
  erb :new_post
end

patch '/new_post' do
  redirect "/login" unless logged_in?
  add_new_post(params["description"], params["image_url"], params["user_id"])
  redirect '/'
end

get '/edit_post' do 
  erb :edit_post
end


get '/:anything' do 
  "404 not found #{params[:anything]}"
end






