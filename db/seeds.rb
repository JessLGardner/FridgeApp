Fridge.destroy_all

rihanna = Fridge.create(location: "kitchen", brand: "Ikea", size: 20, has_food: true, has_drink: true)

rihanna.food = [
    Food.create(fridge_id: rihanna.id, name: "hot dog", weight: 10, is_vegan: false),
    Food.create(fridge_id: rihanna.id, name: "spinach", weight: 30, is_vegan: true),
    Food.create(fridge_id: rihanna.id, name: "brie cheese", weight: 8, is_vegan: false)
]

rihanna.drink = [
    Drink.create(fridge_id: rihanna.id, name: "pop", size: 12, is_alcoholic: false),
    Drink.create(fridge_id: rihanna.id, name: "beer", size: 40, is_alcoholic: true),
    Drink.create(fridge_id: rihanna.id, name: "almond milk", size: 8, is_alcoholic: false)
]