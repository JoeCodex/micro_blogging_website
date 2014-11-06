require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'sinatra/flash'

set :database, 'sqlite3:formdemo.sqlite3'
enable :sessions

get "/" do
  if session[:user_id].nil?
    @user = nil
  else
    @user = User.find(session[:user_id])
  end

  erb :index
end

get "/logout" do
  session[:user_id] = nil
    redirect "/"
end





get "/signup" do
  erb :signup
end

post "/signup" do
  p params[:user]
  @user = User.new(params[:user])
  if @user.save
    flash[:notice] = "Succesfully Created Profile"
  else
    flash[:notice] = "Please Try Again"
  end
  redirect "/"
end

post "/login" do
  @user = User.where(email: params[:email]).first
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    flash[:notice] = "Welcome"
  else
    flash[:notice] = "Invalid E-mail or Password. Please Try Again!"
  end
  redirect "/"
end