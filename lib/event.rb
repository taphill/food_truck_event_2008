class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    food_trucks << food_truck
  end

  def food_truck_names
    food_trucks.map(&:name)
  end

  def food_trucks_that_sell(item)
    food_trucks.map do |truck|
      next unless truck.inventory.keys.include?(item)

      truck
    end.compact
  end

  def total_inventory
    inventory = initialize_inventory_hash.each do |item, data|
      food_trucks.each do |truck|
        next unless truck.inventory.keys.include?(item)
    
        data[:quantity] += truck.inventory[item]
        data[:food_trucks] << truck
      end
    end

    inventory
  end

  private

  def initialize_inventory_hash
    inventory_hash = {}
    food_trucks.each do |truck|
      truck.inventory.each do |item, amount|
        inventory_hash[item] = { quantity: 0, food_trucks: [] }
      end
    end

    inventory_hash
  end
end
