class Post < ApplicationRecord
  # acts_as_taggable
  belongs_to :user
  mount_uploader :image, ImageUploader
end
