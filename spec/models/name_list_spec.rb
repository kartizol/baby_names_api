require 'rails_helper'

RSpec.describe NameList, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:code) }
  end

  describe 'associations' do
    it { should have_many(:names) }
  end
end
