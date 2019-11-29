class Review < ApplicationRecord
  belongs_to :cocktail
  validates :content, presence: true
  RATING = [0, 1, 2, 3, 4, 5].freeze
  validates :rating, inclusion: { in: RATING }
end
