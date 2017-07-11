require 'rack-flash'

class PlaydatesController < ApplicationController

use Rack::Flash

  get '/playdates' do 
    if logged_in?
      @playdates = Playdate.all
      erb :'/playdates/index'
    else 
      redirect to :"/"
    end
  end

  get '/playdates/new' do
    if logged_in?
      @parent = Parent.find_by_id(session[:id])
      erb :'/playdates/new'
    else 
      redirect to "/"
    end
  end

  post '/playdates/new' do
    datetime = params[:when].gsub('/', '-') + ':00'
    @playdate = Playdate.create(name: params[:name], description: params[:description], location: params[:location], datetime: datetime, originator: session[:id])
    @children = params[:children]
    @children.each do |child|
      Participant.create(parent_id: session[:id], child_id: child[:child_id], playdate_id: @playdate.id)
    end
    
    flash[:message] = "Your playdate has been created!"
    redirect to :"/playdates"
  end

  post '/playdates/join' do
    @playdate = Playdate.find_by_id(params[:playdate_id])
    @parent = Parent.find_by_id(session[:id]) 
    @children = params[:children]
    @children.each do |child|
      Participant.create(parent_id: @parent.id, child_id: child[:child_id], playdate_id: @playdate.id)
    end
    flash[:message] = "Your child was added to this play date!"
    redirect to :"/playdates/#{@playdate.slug}"
  end

   post '/playdates/comment' do
    @playdate = Playdate.find_by_id(params[:playdate_id])
    Comment.create(comment: params[:comment], parent_id: session[:id], playdate_id: params[:playdate_id])
    redirect to :"/playdates/#{@playdate.slug}"
  end

  get '/playdates/:slug' do
    if logged_in?
      @playdate = Playdate.find_by_slug(params[:slug])
      @originator = Parent.find_by_id(@playdate.originator)
      @parent = Parent.find_by_id(session[:id])
      @participants = @playdate.children
      @comments = Comment.find_by(playdate_id: @playdate.id)
      erb :"/playdates/show"
    else 
      redirect to :"/"
    end
  end

  get '/playdates/:id/edit' do
    if logged_in?
      @parent = Parent.find_by_id(session[:id])
      @playdate = Playdate.find_by_id(params[:id])
      @originator = Parent.find_by_id(@playdate.originator)
      erb :"/playdates/edit"
    else 
      redirect to :"/"
    end
  end

  patch '/playdates/:id' do
    @playdate = Playdate.find_by_id(params[:id])
    @playdate.originator = @playdate.originator
    @playdate.name = params[:name]
    @playdate.location = params[:location]
    @playdate.description = params[:description]
    @playdate.date = params[:date]
    @playdate.time = params[:time]
    @playdate.save
    redirect to :"/playdates/#{@playdate.slug}"
  end

  delete '/playdates/comment/delete' do
    @playdate = Playdate.find_by_id(params[:playdate_id])
    @comment = Comment.find_by_id(params[:comment_id])
    @comment.delete
    redirect to :"/playdates/#{@playdate.slug}"
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
