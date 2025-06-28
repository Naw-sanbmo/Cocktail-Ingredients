class Cocktail < ApplicationRecord
  has_many :doses
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  has_one_attached :photo
end
