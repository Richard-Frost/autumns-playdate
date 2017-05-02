class ParentsController < ApplicationController
  require 'pry'

  get '/parents' do 
    erb :'parents/parents'
  end

  get '/parents/signup' do
    erb :'parents/signup'
  end

  post '/parents/signup' do 
    @parent = Parent.create(name: params[:name], email: params[:email], phone: params[:phone], password: params[:password])
    @child = Child.create(name: params[:child], age: params[:childs_age], gender: params[:gender])
    Relationship.create(parent_id: @parent.id, child_id: @child.id)
    session[:id] = @parent.id
    redirect to :"/parents/home"

  end

  get '/parents/home' do
    @parent = Parent.find_by_id(session[:id])
    erb :'/parents/home'
  end

  get '/parents/login' do
      erb :'/parents/login'
  end

  post '/login' do
  @parent = Parent.find_by(email: params[:email])
    if @parent && @parent.authenticate(params["password"])
      session[:id] = @parent.id
      binding.pry
      redirect to :"/parents/home"
    end
    end

    get '/parents/logout' do
      session.clear
      redirect to :"/"
    end
  

end