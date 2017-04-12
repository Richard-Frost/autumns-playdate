class ParentsController < ApplicationController

  get '/parents' do 
    erb :'parents/parents'
  end

  get '/parents/signup' do
    erb :'parents/signup'
  end

  post '/parents/signup' do 
    @parent = Parent.create(name: params[:name], email: params[:email], phone: params[:phone])
    @child = Child.create(name: params[:name])
    redirect to :"/parents/home"
  end

  get '/parents/home' do
    erb :'/parents/home'
  end

end