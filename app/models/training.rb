class Training < ApplicationRecord
  belongs_to :company
  has_many :lessons, inverse_of: :training
end
