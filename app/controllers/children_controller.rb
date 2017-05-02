class ChildrenController < ApplicationController

  get '/children' do 
    erb :'/children/new'
  end

  get '/children/new' do 
    erb :'/children/new'
  end

  post '/children/new'  do
    @child = Child.create(name: params[:child], age: params[:childs_age], gender: params[:gender])
    @parent = Parent.find_by_id(session[:id])
    Relationship.create(parent_id: @parent.id, child_id: @child.id)
    redirect to '/parents/home'
  end
end
