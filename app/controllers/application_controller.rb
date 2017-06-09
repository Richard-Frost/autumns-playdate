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
    erb :index
  end

  helpers do

    def logged_in?
      !!session[:id]
    end

    def current_user
      Parent.find_by_id(session[:id])
    end
  end
  

  #post '/parents' do

    #parent = Parent.new(name: params[:name])

    #if parent.save
      #redirect
    #else
      #redirect '/parents/new'
    #end 
  #end

 # @parent ||= P
      #arent.find_by_id(session[:id])
end
