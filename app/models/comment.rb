class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :chirp

  after_create -> { chirp.update(comments_counter: chirp.comments_counter + 1) }
  after_destroy -> { chirp.update(comments_counter: chirp.comments_counter - 1) }
end
