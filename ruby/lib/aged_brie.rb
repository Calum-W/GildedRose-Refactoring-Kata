class AgedBrie

  attr_accessor :sell_in, :quality

  def initialize(sell_in, quality)
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality()
    @sell_in -= 1

    if @quality < 50 && @sell_in > 0
      @quality += 1
    elsif @quality < 49 && @sell_in <= 0
      @quality += 2
    else
      @quality = 50
    end
  end


end
