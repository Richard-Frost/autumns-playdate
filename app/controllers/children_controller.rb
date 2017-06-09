class ChildrenController < ApplicationController

  get '/children' do 
    @children = Child.all
    erb :'/children/index'
  end

    get '/children/new' do 
    if logged_in?
      erb :'/children/new'
    else
      redirect to "/"
    end
  end


  post '/children/new'  do
      @child = Child.create(name: params[:child], age: params[:childs_age], gender: params[:gender])
      @parent = Parent.find_by_id(session[:id])
      @relationship = Relationship.create(parent_id: @parent.id, child_id: @child.id)
      erb :'/parents/home'
  end

  get '/children/:slug' do
    @child = Child.find_by_slug(params[:slug])
    @participant = Participant.find_by(child_id: @child.id)
    erb :"/children/show"
  end
  
end
