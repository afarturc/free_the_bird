require 'rails_helper'

RSpec.describe Chirp, type: :model do
  subject(:chirp) { create(:chirp) }

  describe 'associations' do
    it { expect(chirp).to be_valid }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:parent_chirp).class_name('Chirp').with_foreign_key(:parent_chirp_id).inverse_of(:reply_chirps).optional }
    it { is_expected.to have_many(:likes) }
    it { is_expected.to have_many(:reply_chirps).class_name("Chirp").with_foreign_key(:parent_chirp_id) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:body) }
  end

  describe 'scopes' do
    let!(:random_chirps) { create_list(:chirp, 5) }

    context "when searching chirps with 'Hello'" do
      let!(:target_chirp) { create(:chirp, body: "Hello world!") }
      let(:result) { Chirp.search("body", "Hello") }

      it "should return the chirp with matching body" do
        aggregate_failures do
          expect(result.count).to eq(1)
          expect(result).to include(target_chirp)
        end
      end
    end
  end
end
