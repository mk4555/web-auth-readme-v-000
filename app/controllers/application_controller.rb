class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user
  def logged_in?
    !!session[:token]
  end

  def authenticate_user
    client_id = 'MGF3UJT4M45HI0VBYAPRIEPC2NOULAQNUIH5IULF3KTSY0NC'
    secret = 'AM03LYNWMBRFCEPSNOBZAUJ5MNYJ2MYRIDU5LBPGLIJFIFIA'
    redirect_uri = CGI.escape("http://localhost:3000/auth")
    foursquare_url = "https://foursquare.com/oauth2/authenticate?client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}"
    redirect_to foursquare_url unless logged_in?
  end
  end
