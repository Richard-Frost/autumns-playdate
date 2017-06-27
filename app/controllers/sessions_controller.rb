require 'rack-flash'

class SessionsController < ApplicationController

use Rack::Flash

  get '/sessions/signup' do
    erb :'/parents/signup'
  end

  get '/sessions/login' do
    erb :'/parents/login'
  end

  post '/login' do
    @parent = Parent.find_by(email: params[:email])
    if @parent && @parent.authenticate(params["password"])
      session[:id] = @parent.id
      redirect to :"/parents/home"
    else 
      flash[:message] = "Login failed please try again!"
      erb :'/parents/login'
    end
  end

  get '/sessions/logout' do
    session.clear
    redirect to :"/"
  end
  
end
