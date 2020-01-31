class SlideText < ApplicationRecord
  belongs_to :slide
  has_many :slide_text_fragments

  has_rich_text :text
end
