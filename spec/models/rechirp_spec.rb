require 'rails_helper'

RSpec.describe Rechirp, type: :model do
  subject(:rechirp) { create(:rechirp) }

  describe "validations" do
    it { expect(rechirp).to be_valid }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:chirp) }
  end
end
