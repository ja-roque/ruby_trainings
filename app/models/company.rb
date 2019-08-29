# frozen_string_literal: true

class Company < ApplicationRecord
  before_create :generate_slug

  private

  def generate_slug
    self.slug = get_unique_slug self.name
  end

  def get_unique_slug(name)
    slug = name.parameterize
    similar_slugs = Company.where('slug ILIKE ?', "#{slug}%")

    similar_slugs = similar_slugs.pluck(:slug).each_with_object({}) { |found_slug,hash| hash[found_slug] = true }

    count = 0
    base_slug = slug
    begin
      slug = base_slug
      slug += "-#{count + 1}" if count > 0
      count += 1
    end while similar_slugs[slug]

    slug
  end

  has_many :users, inverse_of: :company
  has_many :trainings, inverse_of: :company

end
