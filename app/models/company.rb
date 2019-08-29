class Company < ApplicationRecord
  before_create :generate_slug

  private
    def generate_slug
      self.slug = self.name.parameterize
    end

  has_many :users, inverse_of: :company
  has_many :trainings, inverse_of: :company
end
