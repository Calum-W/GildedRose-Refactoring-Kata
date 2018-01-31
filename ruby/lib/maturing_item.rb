require_relative 'Item'

class MaturingItem < Item

  def update_quality()
    @quality += (@sell_in > 0 ? 1 : 2)
    @sell_in -= 1
    @quality = MAX_QUALITY if @quality > MAX_QUALITY
  end
end
