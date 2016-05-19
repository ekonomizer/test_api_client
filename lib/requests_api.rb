module RequestsApi

  require 'rest-client'
  require 'json'

  API_TEST_PORT = 8888
  API_TEST_HOST = 'turfmediatest.herokuapp.com/'
  API_TEST_LOGIN = 'qwerty1234567890'
  API_SERVER_URL = "https://#{API_TEST_LOGIN}:@#{API_TEST_HOST}/"

  def get_api_server_url
    API_SERVER_URL
  end

  def send_response res
    if !res
      404
    elsif res.code != 200
      res.code
    else
      res.to_str
    end
  end

  def call_api method, route, param1=nil, param2=nil
    resp = nil
    begin
      case method
        when 'get'
          resp = RestClient.get get_api_server_url + route, param1
        when 'post'
          resp = RestClient.post get_api_server_url + route, param1, param2
        when 'update'
          resp = RestClient.put get_api_server_url + route, param1, param2
        when 'delete'
          resp = RestClient.delete get_api_server_url + route
      end
    rescue RestClient::ExceptionWithResponse => err
      err.response
    end
    send_response(resp)
  end

  def create_user email
    call_api 'post', 'users', {:email => email}.to_json, :content_type => :json
  end

  def get_users
    call_api 'get', 'users', :accept => :json
  end

  def get_user id
    call_api 'get', 'users/' + id.to_s, :accept => :json
  end

  def update_user params
    call_api 'update', 'users/' + params[:id].to_s, params.to_json, :content_type => :json
  end

  def delete_user id
    call_api 'delete', 'users/' + id.to_s
  end
end