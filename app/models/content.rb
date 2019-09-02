class Content < ApplicationRecord
  belongs_to :lesson
  has_many :content_data
end
