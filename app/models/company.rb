class Company < ApplicationRecord
  has_many :users, inverse_of: :company
end
