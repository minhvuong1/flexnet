require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry' if development?
require 'bcrypt'

require_relative 'models/users'
require_relative 'models/posts'
require_relative 'models/comments'

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
    posts: posts,
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
    session[:id] = user['id']
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
  redirect "/login" unless logged_in?
  update_user(params["username"], params["name"], params["bio"], params["image_url"], params["id"])
  redirect '/profile'
end

get '/new_post' do
  if logged_in?
    posts = all_posts()
    erb :new_post
  else 
    redirect '/login'
  end
end

patch '/new_post' do
  redirect "/login" unless logged_in?
  add_new_post(params["description"], params["image_url"], params["user_id"])
  redirect '/'
end

get '/edit_post' do
  redirect "/login" unless logged_in? 
  post = find_post_by_id(params["id"])[0]
  erb :edit_post, locals: {post: post}
end

patch '/update_post' do
  redirect "/login" unless logged_in?
  update_post(params["description"], params["image_url"], params["id"])
  redirect '/'
end

post '/add_comment' do
  if params["comments"].length > 0
    add_comment(params["comments"], params["post_id"], params["user_id"])
    redirect '/'
  else 
    redirect '#/'
  end
end

delete '/delete_post' do
  redirect "/login" unless logged_in?
  delete_post(params["id"])
  redirect '/'
end


get '/:anything' do 
  "404 not found #{params[:anything]}"
end






