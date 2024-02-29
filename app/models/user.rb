class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes
  has_many :chirps
  has_many :rechirps
  has_one_attached :profile_picture

  validates :email, uniqueness: true
  validates :username, uniqueness: true
  validates :password, presence: true

  scope :search, -> (field_name, search_string) { where("#{field_name} LIKE ?", "%#{search_string}%") }
end
