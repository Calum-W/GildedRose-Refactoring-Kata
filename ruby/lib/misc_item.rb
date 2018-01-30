class MiscItem

  attr_accessor :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality()
    if @sell_in > 0 && @quality > 0
      @quality -= 1
    elsif @sell_in <= 0
      @quality > 1 ? @quality -= 2 : @quality = 0
    end

    @sell_in -= 1
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
