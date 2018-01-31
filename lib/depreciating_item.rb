require_relative 'Item'

class DepreciatingItem < Item

  def update_quality()
    @quality += 1
    @quality += 1 if @sell_in < 11
    @quality += 1 if @sell_in < 6
    @quality = 0 if @sell_in <= 0
    @quality = MAX_QUALITY if @quality > MAX_QUALITY
    @sell_in -= 1
  end
end
