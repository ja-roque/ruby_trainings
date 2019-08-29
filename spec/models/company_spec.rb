require 'rails_helper'

RSpec.describe Company, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:slug) }
  end

  company = Company.new name: 'samsung-yeah'
  describe company do
    it { should validate_uniqueness_of(:slug) }
  end

end
