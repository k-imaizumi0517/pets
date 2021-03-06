# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach("db/type.csv") do |row|
  Type.create(:name => row[0])
end

CSV.foreach("db/age.csv") do |row|
  Age.create(:number => row[0])
end

CSV.foreach("db/prefecture.csv") do |row|
  Prefecture.create(:name => row[0])
end

CSV.foreach("db/category.csv") do |row|
  Category.create(:name => row[0])
end
