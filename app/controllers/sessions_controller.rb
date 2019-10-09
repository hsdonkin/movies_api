class SessionsController < ApplicationController

  def login
    json_response({:message => "Please log in via post request to /login, or register at /register. Enter username and password into params.", :url => "https://cryptic-ridge-59014.herokuapp.com//login", :register => "https://cryptic-ridge-59014.herokuapp.com/register", :username => "", :password => ""})
  end

  def create
    if params[:username] && params[:password]
        authenticate_result = User.authenticate(params[:username], params[:password])
        json_response(authenticate_result)
    end
  end
end
