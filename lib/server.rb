require 'sinatra'
require './lib/requests_api'


include RequestsApi

# User not found
error(404) { '{"message":"User doesnt exist"}' }

get '/create_user' do
  create_user params[:email]
end

get '/get_user/:id' do
  get_user params[:id]
end

get '/get_users' do
  get_users
end

get '/update_user' do
  update_user params
end

get '/delete_user/:id' do
  delete_user params[:id]
end
