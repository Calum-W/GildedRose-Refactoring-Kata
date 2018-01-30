require_relative 'Item'

class DepreciatingItem < Item

  def update_quality()
    if @sell_in >= 11
      @quality += 1 if quality < MAX_QUALITY
    elsif @sell_in >= 6
      quality < MAX_QUALITY - 1 ? @quality += 2 : @quality = 50
    elsif @sell_in > 0
      quality < MAX_QUALITY - 2 ? @quality += 3 : @quality = 50
    else
      @quality = 0
    end

    @sell_in -= 1
  end
end
