class Item
  attr_accessor :name, :sell_in, :quality

  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality()
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
