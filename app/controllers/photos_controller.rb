class PhotosController < ApplicationController
  before_filter :set_album
  before_action :authenticate_user! , only: [:create]
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

  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to album_photo_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def photo_params
      params.require(:photo).permit(:name, :image, :tag_list)
    end

    def set_album
      @album= Album.find params[:album_id]
    end
end