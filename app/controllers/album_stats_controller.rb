class AlbumStatsController < ApplicationController
  before_action :set_album_stat, only: [:show, :edit, :update, :destroy]

  # GET /album_stats
  # GET /album_stats.json
  def index
    @album_stats = AlbumStat.all
  end

  # GET /album_stats/1
  # GET /album_stats/1.json
  def show
  end

  # GET /album_stats/new
  def new
    @album_stat = AlbumStat.new
  end

  # GET /album_stats/1/edit
  def edit
  end

  

  # POST /album_stats
  # POST /album_stats.json
  def create
    @album_stat = AlbumStat.new(album_stat_params)

    respond_to do |format|
      if @album_stat.save
        format.html { redirect_to @album_stat, notice: 'Album stat was successfully created.' }
        format.json { render :show, status: :created, location: @album_stat }
      else
        format.html { render :new }
        format.json { render json: @album_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /album_stats/1
  # PATCH/PUT /album_stats/1.json
  def update
    puts 'calling update'

    stat = AlbumStat.where({:album => params[:album]}).first

    if stat
      likes= stat.likes
      likes= likes+1
      stat.update_columns(likes: likes)
    end
    puts 'update like success'
  end

  # DELETE /album_stats/1
  # DELETE /album_stats/1.json
  def destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_stat
      @album_stat = AlbumStat.find_by_album(params[:album])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_stat_params
      params[:album_stat]
    end
end
