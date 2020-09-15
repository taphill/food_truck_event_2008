class FoodTruck
  attr_reader :name, :inventory 

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    return 0 unless inventory.keys.include?(item)

    inventory[item]
  end

  def stock(item, amount)
    inventory[item] += amount
  end

  def potential_revenue
    revenue = 0
    inventory.each do |item, amount|
      revenue += (item.price * amount)
    end

    revenue
  end
end
