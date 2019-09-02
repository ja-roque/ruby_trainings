class Slideshow < ApplicationRecord
  belongs_to :content_datum
  has_many :slides
end