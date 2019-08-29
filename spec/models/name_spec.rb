require 'rails_helper'

RSpec.describe Name, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should allow_value('Sally Lou').for(:name) }
    it { should allow_value('      Sally Lou').for(:name) }
    it { should allow_value('  Sally Lou    ').for(:name) }
    it { should allow_value('Sally Lou    ').for(:name) }
    it { should_not allow_value('C3P0').for(:name) }
    it { should_not allow_value('Stan the Man').for(:name) }
  end

  describe 'associations' do
    it { should belong_to(:name_list) }
  end
end
