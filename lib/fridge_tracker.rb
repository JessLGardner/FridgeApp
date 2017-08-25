require_relative '../config/environment'
require_relative '../app/models/fridge'

puts "Enter an option:"

puts "A) List all Fridges"
puts "B) Create a new Fridge"
puts "C) Remove a Fridge"

option = gets.chomp
puts "You selected #{option}"

if option.upcase == 'A'
  all_fridges = Fridge.all
  all_fridges.each_with_index do |fridge|
    puts fridge.location
  end

elsif option.upcase == 'B' 
  puts "enter fridge location"
  location = gets.chomp

  puts "enter fridge brand"
  brand = gets.chomp

  puts "enter fridge size in cubic feet"
  size = gets.chomp

  puts "does your fridge have food? (y/n)"
  has_food = gets.chomp
    if has_food == "y"
      has_food = true
    else
      has_food = false
    end

  puts "does your fridge have drinks? (y/n)"
  has_drink = gets.chomp
    if has_drink == "y"
      has_drink = true
    else
      has_drink = false
    end
  puts "You have created a new fridge!"
  Fridge.create(location: location, brand: brand, size: size, has_food: has_food, has_drink: has_drink)

elsif option.upcase == 'C'
  puts "Which fridge do you want to remove? (enter Location)"
  fridge_to_remove = gets.chomp
  puts "Removing #{fridge_to_remove}"
  Fridge.find_by_location(fridge_to_remove).destroy

end






