class Slideshow < ApplicationRecord
  belongs_to :content, optional: true
  has_many :slides

  mount_uploader :bucket_url, SlideshowUploader
  serialize :bucket_url, JSON
end