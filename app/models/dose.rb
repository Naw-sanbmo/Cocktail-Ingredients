class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates :cocktail, presence: true
  validates :ingredient, presence: true
  validates :ingredient_id, uniqueness: { scope: :cocktail_id, message: "has already been added to this cocktail" }
end
