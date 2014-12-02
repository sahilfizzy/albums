class CommentsController < ApplicationController
  before_action :authenticate_user! , only: [:create]

	def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.create(comment_params)
    redirect_to album_photo_path(@photo.album, @photo)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
