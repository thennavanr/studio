class GalleryController < ApplicationController
  def index
    @albums =[]
    filter = params[:filter]
    Aws.config[:credentials] = Aws::Credentials.new( ENV["AWS_ACCESS_KEY_ID"], ENV["AWS_SECRET_ACCESS_KEY"])
    s3 = Aws::S3::Resource.new(credentials: Aws::Credentials.new(ENV["AWS_ACCESS_KEY_ID"], ENV["AWS_SECRET_ACCESS_KEY"]),region:'us-east-1')
    obj  = s3.bucket("backdrop-studio")
    b =obj.objects(prefix: 'gallery/clients/image')

    b.each do |o| 
      url = o.presigned_url(:get, expires_in: 3600) if(o.key.include?('/1.jpg')) 
      if url 
        val = {}
        album_name = o.key.split("gallery/clients/image/")[1]
        if album_name
          album_name = album_name.split('/')[0]
          if filter
            stat1 = AlbumStat.where("album =  '#{album_name}' and  tags like '%#{filter}%' "  ).first
          else
            stat1 = AlbumStat.where(:album => album_name).first
          end 
          val['url'] = url
          if stat1
            val['views'] = stat1.views 
            val['likes'] = stat1.likes
            val['caption'] = stat1.caption 
            val['order'] = stat1.order
            val['album']=album_name

          else
            val['views'] = 0
            val['likes'] = rand(10) 
            val['caption'] = "no name" 
            val['order'] = rand(100)
            val['album']=album_name
          end
        end
        
        @albums << val if stat1
      end
    end

    @albums = @albums.sort_by{ |hash| hash['order'] }.reverse

  end
end
