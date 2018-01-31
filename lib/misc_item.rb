require_relative 'Item'

class MiscItem < Item

  def update_quality()
    @quality -= (@sell_in > 0 ? 1 : 2)
    @quality = MIN_QUALITY if @quality < MIN_QUALITY
    @sell_in -= 1
  end
end
