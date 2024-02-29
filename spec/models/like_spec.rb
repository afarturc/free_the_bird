require 'rails_helper'

RSpec.describe Like, type: :model do
  subject(:like) { create(:like) }

  describe "validations" do
    it { expect(like).to be_valid }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:chirp) }
  end

  describe "after_create" do
    let(:chirp) { create(:chirp) }

    before do
      create(:like, chirp: chirp)
      chirp.reload
    end
    it "likes counter should increment by one" do
      expect(chirp.likes_counter).to eq(1)
    end
  end

  describe "after_create" do
    let(:chirp) { create(:chirp) }
    let!(:like) { create(:like, chirp: chirp) }

    before do
      like.destroy
      chirp.reload
    end
    it "likes counter should decrement by one" do
      expect(chirp.likes_counter).to eq(0)
    end
  end
end
