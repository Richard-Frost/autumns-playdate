class LocationController < ApplicationController
  
  get '/locations' do 
    if logged_in?
      erb :'/locations/index'
    else 
      redirect to :"/"
    end
  end

  get '/locations/new' do
    if logged_in?
      erb:'/locations/new'
    else 
      redirect to :"/"
    end
  end

  post '/locations/new' do 
    Location.create(name: params[:name], address: params[:address])
    redirect to :'/locations'
  end

  get '/locations/:slug' do
    if logged_in?
      @location = Location.find_by_slug(params[:slug])
      @parent = Parent.find_by_id(session[:id])
      @relationship = Relationship.find_by(parent_id: @parent.id)
      @checked_in = Checkin.find_by(location_id: @location.id)
      erb :"/locations/show"
    else 
      redirect to :"/"
    end
  end

  get '/locations/:id' do
    if logged_in?
      @location = Location.find_by_slug(params[:slug])
      @parent = Parent.find_by_id(session[:id])
      @relationship = Relationship.find_by(parent_id: @parent.id)
      @checked_in = Checkin.find_by(location_id: @location.id)
      erb :"/locations/show"
    else 
      redirect to :"/"
    end
  end

  post "/locations/checkin" do
    @parent = Parent.find_by_id(session[:id])
    @location = Location.find_by_id(params[:location_id])
    params[:children].each do |child|
      Checkin.create(location_id: params[:location_id], child_id: child[:child_id], parent_id: session[:id])
    end
    redirect to :"/locations/#{@location.id}/checked_in"
  end

  get '/locations/:id/checked_in' do
    if logged_in?
      @location = Location.find_by_id(params[:id])
      @parent = Parent.find_by_id(session[:id])
      @checked_in = Checkin.find_by(location_id: @location.id)
      erb :'/locations/checked_in'
    end
  end

  delete '/locations/checkout' do
    @location = Location.find_by_id(params[:location_id])
    @location.checkins.each do |check|
      if check.parent_id == session[:id]
        @checkin = Checkin.find_by(child_id: check.child_id)
        @checkin.delete
      end
    end
    redirect to :"/locations"
  end

end