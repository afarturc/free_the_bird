require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  describe "validations" do
    it { expect(user).to be_valid }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:email) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:likes) }
    it { is_expected.to have_many(:chirps) }
    it { is_expected.to have_many(:rechirps) }
    it { is_expected.to have_one_attached(:profile_picture) }
  end

  describe "scopes" do
    let!(:random_users) { create_list(:user, 5) }

    context "when we search for a user with 'af' in the username" do
      let!(:target_user) { create(:user, username: "afartur") }
      let(:result) { User.search("username", "af") }

      it "should return a single user with the requested username" do
        aggregate_failures do
          expect(result.count).to eq(1)
          expect(result).to include(target_user)
        end
      end
    end
  end
end
