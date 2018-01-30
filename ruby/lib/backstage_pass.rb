class BackstagePass

  attr_accessor :sell_in, :quality

  def initialize(sell_in, quality)
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality()
    if @sell_in > 11
      @quality += 1 if quality < 50
    elsif @sell_in > 6
      quality < 49 ? @quality += 2 : @quality = 50
    elsif @sell_in > 0
      quality < 48 ? @quality += 3 : @quality = 50
    else
      @quality = 0
    end

    @sell_in -= 1
  end
end
