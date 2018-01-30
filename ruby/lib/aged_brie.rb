require_relative 'Item'

class AgedBrie < Item

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
