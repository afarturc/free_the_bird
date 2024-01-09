require 'rails_helper'

RSpec.describe Chirp, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:parent_chirp).class_name('Chirp').with_foreign_key(:parent_chirp_id).inverse_of(:reply_chirps).optional }
    it { should have_many(:likes) }
    it { should have_many(:reply_chirps) }
  end

  describe 'validations' do
    it { should validate_presence_of(:body) }
  end

  describe 'scopes' do
  end
end
