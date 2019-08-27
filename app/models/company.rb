class Company < ApplicationRecord
  has_many :users, inverse_of: :company
  has_many :trainings, inverse_of: :company
end
