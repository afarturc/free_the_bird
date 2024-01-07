class Chirp < ApplicationRecord
  belongs_to :user
  has_many :likes

  validates :body, presence: true

  belongs_to :parent_chirp, inverse_of: :reply_chirps, foreign_key: :parent_chirp_id, class_name: "Chirp", optional: true
  has_many :reply_chirps, foreign_key: :parent_chirp_id, class_name: "Chirp"

  scope :search, -> (field_name, search_string) { where("#{field_name} LIKE ?", "%#{search_string}%") }


  after_create :increment_if_reply
  after_destroy :decrement_if_reply

  private

  def increment_if_reply
    parent_chirp = self.parent_chirp
    parent_chirp.update(replies_count: parent_chirp.replies_count + 1) unless self.parent_chirp.nil?
  end

  def decrement_if_reply
    parent_chirp = self.parent_chirp
    parent_chirp.update(replies_count: parent_chirp.replies_count - 1) unless self.parent_chirp.nil?
  end
end
