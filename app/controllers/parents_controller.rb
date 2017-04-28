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
    @child = Child.create(name: params[:child])
    Relationship.create(parent_id: @parent.id, child_id: @child.id)
    session[:id] = @parent.id
    redirect to :"/parents/home"
  end

  get '/parents/home' do
    @parent = Parent.find_by_id(session[:id])
    erb :'/parents/home'
  end

end