class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_picture

  scope :search, -> (field_name, search_string) { where("#{field_name} LIKE ?", "%#{search_string}%") }

  has_many :likes
  has_many :comments
  has_many :chirps
end
