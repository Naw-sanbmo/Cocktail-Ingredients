# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'json'

puts "Seeding ingredients from JSON..."

# Load the file
file_path = Rails.root.join('db', 'ingredients.json')
file_content = File.read(file_path)

# Parse the JSON
data = JSON.parse(file_content)

# Optional: clear old ingredients
Ingredient.destroy_all

# Extract and create ingredients
data["drinks"].each do |item|
  name = item["strIngredient1"]
  next if name.blank? # skip if name is nil or empty

  Ingredient.find_or_create_by!(name: name)
end

puts "✅ Seeded #{Ingredient.count} ingredients from JSON."
