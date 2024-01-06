class Like < ApplicationRecord
  belongs_to :user
  belongs_to :chirp

  after_create -> { chirp.update(likes_counter: chirp.likes_counter + 1) }
  after_destroy -> { chirp.update(likes_counter: chirp.likes_counter - 1) }

  def self.has_user_liked_chirp?(user, chirp)
    exists?(user: user, chirp: chirp)
  end
end
