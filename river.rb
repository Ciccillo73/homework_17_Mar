class River

  attr_reader :name, :fishes

  def initialize(name, fishes)
    @name = name
    @fishes = fishes
  end

  def count_fish()
    return @fishes.size()
  end

  def get_fish()
    return @fishes.shift()
  end

end
