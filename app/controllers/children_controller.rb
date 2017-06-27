class ChildrenController < ApplicationController

  get '/children' do 
    if logged_in?
      @children = Child.all
      erb :'/children/index'
    else 
      redirect to "/"
    end
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
    Relationship.create(parent_id: session[:id], child_id: @child.id)
    redirect to :"/parents/home"
  end

  get '/children/:slug' do
    if logged_in?
      @child = Child.find_by_slug(params[:slug])
      @participant = Participant.find_by(child_id: @child.id)
      erb :"/children/show"
    else 
      redirect to "/"
    end
  end

end
