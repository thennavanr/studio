class PhotoListingController < ApplicationController
  def index

    if session[:auth] == "authenticated" && session[:album] == params["b"]
      @albums =[]
      Aws.config[:credentials] = Aws::Credentials.new( ENV["AWS_ACCESS_KEY_ID"], ENV["AWS_SECRET_ACCESS_KEY"])
      s3 = Aws::S3::Resource.new(credentials: Aws::Credentials.new(ENV["AWS_ACCESS_KEY_ID"], ENV["AWS_SECRET_ACCESS_KEY"]),region:'us-east-1')
      obj  = s3.bucket("backdrop-studio")
      b =obj.objects(prefix: "gallery/clients/image/#{params["b"]}")
      b.each do |o| @albums << o.presigned_url(:get, expires_in: 3600) if(o.key.include?('.jpg')) end


      stat1 = AlbumStat.where({:album => params["b"] }).first
      if stat1
        view = stat1.views
        view = view +1
        stat1.update_columns(views: view)
      end



    else
      redirect_to (login_path(:b => params["b"])) 
    end
  end

end
