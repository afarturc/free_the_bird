require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:likes) }
    it { should have_many(:chirps) }
    it { should have_many(:rechirps) }
    it { should have_one_attached(:profile_picture) }
  end
end
