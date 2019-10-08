class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  acts_as_taggable
end
