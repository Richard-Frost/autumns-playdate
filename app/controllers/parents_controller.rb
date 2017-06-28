class ParentsController < ApplicationController
  require 'rack-flash'

  get '/parents' do 
    if logged_in?
      @parents = Parent.all
      erb :'/parents/index'
    else 
      redirect to :"/"
    end
  end

  get '/parents/signup' do
    erb :'parents/signup'
  end

  post '/parents/signup' do 
    @name = "#{params[:first_name]} #{params[:last_name]}"
    @parent = Parent.create(name: @name, email: params[:email], password: params[:password])
    @child = Child.create(name: params[:child], age: params[:childs_age], gender: params[:gender])
    Relationship.create(parent_id: @parent.id, child_id: @child.id)
    session[:id] = @parent.id
    redirect to :"/parents/home"
  end

  get '/parents/home' do
    if logged_in?
      @parent = Parent.find_by_id(session[:id])
      @participant = Participant.find_by(parent_id: @parent.id)
      @playdates = Playdate.all
      erb :'/parents/home'
    else 
      redirect to "/"
    end
  end

  get '/parents/login' do
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

    get '/parents/logout' do
      session.clear
      redirect to :"/"
    end

    get '/parents/:slug' do
      if logged_in?
        @parent = Parent.find_by_slug(params[:slug])
        erb :"/parents/show"
      else 
        redirect to :"/"
    end
  end
  
end