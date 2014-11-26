class Photo < ActiveRecord::Base
    
    has_many :comments
	belongs_to :album
	mount_uploader :image, ImageUploader 

end
