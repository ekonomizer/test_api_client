
require_relative 'test_helper.rb'
require 'rack/test'
require 'json'
require_relative '../lib/server.rb'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe "Sinatra Webhook Server" do


  it "should create a user and return an id" do
    get "/create_user?email=user@example.com"
    last_response.body.must_include 'new user recorded'
    JSON.parse(last_response.body)['user_id'].must_be_instance_of Fixnum
  end

  it "should return json" do
    get "/create_user?email=user@example.com"
    last_response.headers['Content-Type'].must_include 'text/html'
  end

  it "should retrieve all users" do
    get "/create_user?email=user@example.com"
    get "/create_user?email=user2@example.com"
    get "/get_users"
    last_response.body.must_include 'user@example.com'
    last_response.body.must_include 'user2@example.com'
  end

  it "should return a user from its id" do
    get '/create_user?email=user@example.com'
    id = JSON.parse(last_response.body)['user_id']
    get "/get_user/#{id}"
    last_response.body.must_include 'user@example.com'
  end

  it "should update a user and return user" do
    get '/create_user?email=user@example.com'
    id = JSON.parse(last_response.body)['user_id']
    get "/update_user?id=#{id}&email=update2@example.com"
    last_response.body.must_include "user updated #{id}"
  end

  it "should delete a user" do
    get '/create_user?email=user@example.com'
    id = JSON.parse(last_response.body)['user_id']
    get "/delete_user/#{id}"
    last_response.body.must_include "user deleted #{id}"
  end




end
