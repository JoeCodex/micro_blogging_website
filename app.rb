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