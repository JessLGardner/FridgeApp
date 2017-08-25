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
    puts "Here's a list of the food in the #{fridge_selected} fridge:"
    Fridge.find_by_location(fridge_selected).food.all.each_with_index do |food|
      puts food.name
    end
      puts "Would you like to add some food to #{fridge_selected}? (y/n)"
      add_food = gets.chomp
        if add_food == "y"
          puts "Enter food name."
          name = gets.chomp

          puts "Enter food weight in pounds."
          weight = gets.chomp

          puts "Is your food vegan? (y/n)"
            is_vegan = gets.chomp
              if is_vegan == "y"
                has_food = true
              else
                is_vegan = false
              end
          puts "You have added a new food to #{fridge_selected}!"
          Food.create(name: name, weight: weight, is_vegan: is_vegan)

        end




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
# Add a food item to a fridge
# Eat a food item from a fridge (delete it)
# View all drink items in a specific fridge
# Add a drink item to a fridge
# Consume PART of a drink from a fridge (update its size in ounces)
# Consume ALL of a drink from a fridge (delete it)


