class ParentsController < ApplicationController

  get '/parents' do 
    erb :'parents/parents'
  end

  get '/parents/signup' do
    erb :'parents/signup'
  end
end