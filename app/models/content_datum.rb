class ContentDatum < ApplicationRecord
  belongs_to :content
  has_one :slideshow
end
