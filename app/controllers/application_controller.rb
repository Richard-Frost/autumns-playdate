require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    if logged_in?
      redirect to :"/parents/home"
    else
     erb :'/index'
    end
  end

  get "/about" do
    erb :about, layout: :'/layout-about'
  end

  get '/account' do
    erb :account
  end

  helpers do

    def logged_in?
      !!session[:id]
    end

    def current_user
      Parent.find_by_id(session[:id])
    end
  end

end
