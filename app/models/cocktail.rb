class Cocktail < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :doses
  has_many :ingredients, through: :doses, dependent: :delete_all
  has_many :reviews, dependent: :delete_all
  mount_uploader :photo, PhotoUploader
end
