class Slideshow < ApplicationRecord
  belongs_to :content
  has_many :slides
end