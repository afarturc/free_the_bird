class Chirp < ApplicationRecord
  belongs_to :user
  has_many :likes

  validates :body, presence: true

  belongs_to :parent_chirp, inverse_of: :reply_chirps, foreign_key: :parent_chirp_id, class_name: "Chirp", optional: true, counter_cache: :replies_count
  has_many :reply_chirps, foreign_key: :parent_chirp_id, class_name: "Chirp"

  scope :search, -> (field_name, search_string) { where("#{field_name} LIKE ?", "%#{search_string}%") }
end
