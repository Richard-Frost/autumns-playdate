require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :index
  end

  #post '/parents' do

    #parent = Parent.new(name: params[:name])

    #if parent.save
      #redirect
    #else
      #redirect '/parents/new'
    #end 
  #end

end
