class Rechirp < ApplicationRecord
  belongs_to :user
  belongs_to :chirp

  def self.has_user_rechirped?(user, chirp)
    exists?(user: user, chirp: chirp)
  end
end
