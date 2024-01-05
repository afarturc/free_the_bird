class Chirp < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  validates :body, presence: true

  scope :search, -> (field_name, search_string) { where("#{field_name} LIKE ?", "%#{search_string}%") }
end
