class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  # GET /albums
  # GET /albums.json
  def index
    @albums =[]
    Aws.config[:credentials] = Aws::Credentials.new( ENV["AWS_ACCESS_KEY_ID"], ENV["AWS_SECRET_ACCESS_KEY"])
    s3 = Aws::S3::Resource.new(credentials: Aws::Credentials.new(ENV["AWS_ACCESS_KEY_ID"], ENV["AWS_SECRET_ACCESS_KEY"]),region:'us-east-1')
    obj  = s3.bucket("backdrop-studio")
    b =obj.objects(prefix: "gallery/portfolio/image")
    b.each do |o|
      url = o.presigned_url(:get, expires_in: 3600) if(o.key.include?('.jpg')) 
      if url
        val = {}
        album_name =  o.key.split('gallery/portfolio/image')[1]
        if album_name 
          album_name = album_name.split('/')[1]
          name = album_name
          stat = AlbumStat.where({:album => album_name}).first
          val['url'] = url
          if stat
            val['views'] = stat.views 
            val['likes'] = stat.likes
            val['caption'] = stat.caption 
            val['order'] = stat.order
            val['album_name'] = album_name
          else
            val['views'] = 0
            val['likes'] = 0 
            val['caption'] = "no name" 
            val['order'] = rand(100)
            val['album_name'] = album_name
          end
        end
        @albums << val
        @albums = @albums.sort_by{ |hash| hash['order'] }
      end
    end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @path = params[:url] 

      #@album = Album.find_by_album(params[:album])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:user, :password, :album_name, :secured, :created_date)
    end
end
