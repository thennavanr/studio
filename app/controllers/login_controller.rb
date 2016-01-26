class LoginController < ApplicationController
  def index
    album = params[:b];
    @auth = Authentication.new

  end
end
