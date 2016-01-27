class LoginController < ApplicationController

  def index
    album = params['name']
    auth =Authentication.where(album: album).first 

    if auth.nil?
      redirect_to gallery_path 
    else
      password = params["login"]["pass"]

      if auth.password == password
        session[:auth] = "authenticated"
        session[:album] = album
        redirect_to photo_listing_path(:b => album)
      end 
    end
  end

  def create 
    album = params[:b];
    @auth =Authentication.where(album: album) 
  end
  def show 
    album = params[:b];
    @auth =Authentication.new
  end
end
