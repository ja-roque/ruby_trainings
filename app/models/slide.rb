class Slide < ApplicationRecord
  belongs_to :slideshow
  has_many :slide_links
  has_many :slide_images
  has_many :slide_videos
  has_many :slide_texts
end
