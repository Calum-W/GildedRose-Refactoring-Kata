class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(args)
    @name = args[:name]
    @sell_in = args[:sell_in]
    @quality = args[:quality]
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
