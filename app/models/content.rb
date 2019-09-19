class Content < ApplicationRecord
  belongs_to :lesson
  has_many :slideshows
end
