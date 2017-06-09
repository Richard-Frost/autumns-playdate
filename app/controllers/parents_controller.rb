class ParentsController < ApplicationController
  require 'pry'
  require 'rack-flash'

  get '/parents' do 
    @parents = Parent.all
    erb :'/parents/index'
  end

  get '/parents/signup' do
    erb :'parents/signup'
  end


  post '/parents/signup' do 
    @name = "#{params[:first_name]} #{params[:last_name]}"
    @parent = Parent.create(name: @name, email: params[:email], phone: params[:phone], password: params[:password])
    @child = Child.create(name: params[:child], age: params[:childs_age], gender: params[:gender])
    Relationship.create(parent_id: @parent.id, child_id: @child.id)
    session[:id] = @parent.id
    redirect to :"/parents/home"

  end

  get '/parents/home' do
    if logged_in?
      @parent = Parent.find_by_id(session[:id])
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
      @parent = Parent.find_by_slug(params[:slug])
    erb :"/parents/show"
  end
  
end