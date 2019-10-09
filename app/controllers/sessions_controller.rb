class SessionsController < ApplicationController

  def login
    json_response({:message => "Please Log In via post request to /login, or register at /register", :login => "http:// cryptic-ridge-59014.herokuapp.com/login", :register =>"http:// cryptic-ridge-59014.herokuapp.com/register" :username => "username", :password => "password"})
  end

  def create
    if request.headers["HTTP_USERNAME"] && request.headers["HTTP_PASSWORD"]
        authenticate_result = User.authenticate(request.headers["HTTP_USERNAME"], request.headers["HTTP_PASSWORD"])
        json_response(authenticate_result)
    end
  end
end
