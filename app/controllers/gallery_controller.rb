class GalleryController < ApplicationController
  def index
    @albums =[]
    Aws.config[:credentials] = Aws::Credentials.new( ENV["AWS_ACCESS_KEY_ID"], ENV["AWS_SECRET_ACCESS_KEY"])
    s3 = Aws::S3::Resource.new(credentials: Aws::Credentials.new(ENV["AWS_ACCESS_KEY_ID"], ENV["AWS_SECRET_ACCESS_KEY"]),region:'us-east-1')
    obj  = s3.bucket("backdrop-studio")
    b =obj.objects(prefix: 'gallery/clients/image')
    b.each do |o| @albums << o.presigned_url(:get, expires_in: 3600) if(o.key.include?('/1.jpg')) end
  end
  
end
