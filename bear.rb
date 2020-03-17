class Bear

  attr_reader :name, :type

  def initialize(name, type)
    @name = name
    @type = type
    @food = []

  end

  def roar
    return "Rooooar!"
  end

  def food_count()
    @food.size()
  end

  def take_fish(river)
    fish = river.get_fish
    @food.push(fish) if !fish.nil?
  end
end
