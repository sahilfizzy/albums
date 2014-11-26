class PhotosController < ApplicationController
  before_filter :set_album
  def show
    @photo = @album.photos.find params[:id]
  end

  def new
    @photo = @album.photos.new
  end


  def create
    @album = Album.find(params[:album_id])
    @photo = @album.photos.create(photo_params)
    redirect_to album_path(@album)
  end

  private
    def photo_params
      params.require(:photo).permit(:name, :image)
    end

    def set_album
      @album= Album.find params[:album_id]
    end
end