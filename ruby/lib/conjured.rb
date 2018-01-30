require_relative 'Item'

class Conjured < Item

  attr_accessor :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality()
    if @quality <= 2
      @quality = 0
    elsif @sell_in <= 0
      @quality <= 4 ? @quality = 0 : @quality -= 4
    else
      @quality -=2
    end

    @sell_in -= 1
  end
end
