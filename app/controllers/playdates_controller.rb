require 'rack-flash'

class PlaydatesController < ApplicationController

use Rack::Flash

layout '../views/layout'
    
  get '/playdates' do 
    @parent = Parent.find_by(session[:id])
    @relationship = Relationship.find_by(parent_id: @parent.id)
    @child = Child.find_by_id(@relationship.child_id)
    @participant = Participant.find_by_id(@child.id)
    erb :'/playdates/index'
  end

  get '/playdates/new' do
    if logged_in?
      @parent = Parent.find_by(session[:id])
      @relationship = Relationship.find_by(parent_id: @parent.id)
      @child = Child.find_by_id(@relationship.child_id)
      erb :'/playdates/new'
    else 
      redirect to "/"
    end
  end

  post '/playdates/new' do
    @parent = Parent.find_by(session[:id])
    @relationship = Relationship.find_by(parent_id: @parent.id)
    @child = Child.find_by_id(@relationship.child_id)
    @datetime = params[:date] + params[:time]
    @playdate = Playdate.create(name: params[:name], description: params[:description], location: params[:location],date: params[:date],time: params[:time], originator: @parent.id)
    @playdate.datetime = @datetime
    @playdate.save
    @children = params[:children]
    @children.each do |child|
      Participant.create(parent_id: @parent.id, child_id: child[:child_id], playdate_id: @playdate.id)
    end
    #Relationship.create(parent_id: @parent.id, child_id: @child.id)
    flash[:message] = "Your playdate has been created!"
    redirect to :"/playdates"
  end

  post '/playdates/join' do
    @playdate = Playdate.find_by_id(params[:playdate_id])
    @parent = Parent.find_by_id(session[:id]) 
    #@relationship = Relationship.find_by(parent_id: @parent.id)
    #@child = Child.find_by_id(@relationship.child_id)
    @children = params[:children]
    @children.each do |child|
      Participant.create(parent_id: @parent.id, child_id: child[:child_id], playdate_id: @playdate.id)
    end
    flash[:message] = "Your playdate has been created!"
    redirect to :"/playdates"
  end

   post '/playdates/comment' do
    Comment.create(comment: params[:comment], parent_id: session[:id], playdate_id: params[:playdate_id])
    redirect to :"/playdates"
  end

  get '/playdates/:slug' do
    @playdate = Playdate.find_by_slug(params[:slug])
    @originator = Parent.find_by_id(@playdate.originator)
    @parent = Parent.find_by_id(session[:id])
    @participants = @playdate.children
    @comments = Comment.find_by(playdate_id: @playdate.id)
    erb :"/playdates/show"
  end

  get '/playdates/:id/edit' do
  @parent = Parent.find_by_id(session[:id])
  @playdate = Playdate.find_by_id(params[:id])
  @relationship = Relationship.find_by(parent_id: @parent.id)
  @child = Child.find_by_id(@relationship.child_id)
  @originator = Parent.find_by_id(@playdate.originator)
  erb :"/playdates/edit"
  end

  patch '/playdates/:id' do
    @playdate = Playdate.find_by_id(params[:id])
    @playdate.name = params[:name]
    @playdate.location = params[:location]
    @playdate.description = params[:description]
    @playdate.date = params[:date]
    @playdate.time = params[:time]
    @playdate.save
    erb :'/playdates/index'
  end

  delete '/playdates/:id/delete' do
    @playdate = Playdate.find_by_id(params[:playdate_id])
    @participant = Participant.find_by(playdate_id: @playdate.id)

    if @playdate.originator == session[:id]
      @participant.delete
      @playdate.delete
      redirect to :"/playdates"
    end
  end

end
