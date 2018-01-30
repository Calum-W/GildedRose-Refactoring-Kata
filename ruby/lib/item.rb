class Item
  attr_accessor :name, :sell_in, :quality

  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def initialize(args)
    @name = args[:name]
    @sell_in = args[:sell_in]
    @quality = args[:quality]
  end

  def update_quality()
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
