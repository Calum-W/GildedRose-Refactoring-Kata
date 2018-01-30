require_relative 'Item'

class MiscItem < Item

  def update_quality()
    if @sell_in > 0 && @quality > MIN_QUALITY
      @quality -= 1
    elsif @sell_in <= 0
      @quality > MIN_QUALITY + 1 ? @quality -= 2 : @quality = 0
    end

    @sell_in -= 1
  end
end
