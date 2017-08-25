require_relative '../config/environment'
require_relative '../app/models/fridge'

puts "Enter an option:"

puts "A) List all Fridges"
puts "B) Create a new Fridge"
puts "C) Remove a Fridge"

option = gets.chomp
puts "You selected #{option.upcase}"

if option.upcase == 'A'
  all_fridges = Fridge.all
  all_fridges.each_with_index do |fridge|
    puts fridge.location
  end
    fridge_selected = gets.chomp
    Fridge.find_by_location(fridge_selected).Food.all
    # puts fridge_selected.Food.all

# Food.joins(:fridge).where('Fridge.location = fridge_selected')




elsif option.upcase == 'B' 
  puts "Enter fridge location."
  location = gets.chomp
  puts "Enter fridge brand."
  brand = gets.chomp
  puts "Enter fridge size in cubic feet."
  size = gets.chomp
  puts "Does your fridge have food? (y/n)"
  has_food = gets.chomp
    if has_food == "y"
      has_food = true
    else
      has_food = false
    end
  puts "Does your fridge have drinks? (y/n)"
  has_drink = gets.chomp
    if has_drink == "y"
      has_drink = true
    else
      has_drink = false
    end
  puts "You have created a new fridge!"
  Fridge.create(location: location, brand: brand, size: size, has_food: has_food, has_drink: has_drink)

elsif option.upcase == 'C'
  puts "Which fridge do you want to remove? (enter location)"
  fridge_to_remove = gets.chomp
  puts "Removing #{fridge_to_remove}"
  Fridge.find_by_location(fridge_to_remove).destroy
else
  puts "Oops! You must select 'A', 'B' or 'C.'"
end






# TO DO
# View all food items in a specific fridge
# Add a food item to a fridge
# Eat a food item from a fridge (delete it)
# View all drink items in a specific fridge
# Add a drink item to a fridge
# Consume PART of a drink from a fridge (update its size in ounces)
# Consume ALL of a drink from a fridge (delete it)


