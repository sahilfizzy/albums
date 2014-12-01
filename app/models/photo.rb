class Photo < ActiveRecord::Base
    #attr_accessible :name, :image, :tag_list
    has_many :comments, dependent: :destroy
	belongs_to :album
	mount_uploader :image, ImageUploader 
	acts_as_taggable

end
