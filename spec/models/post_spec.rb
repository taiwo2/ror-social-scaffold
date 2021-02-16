require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) { build(:post) }

  describe 'associations' do
    it { is_expected.to have_many(:likes) }

    it { is_expected.to have_many(:comments) }

    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:content) }

    it { is_expected.to validate_length_of(:content).is_at_most(1000) }
  end
end
