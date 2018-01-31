require_relative 'Item'

class ConjuredItem < Item

  def update_quality
    if @quality > 0
      @quality -= (@sell_in > 0 ? 2 : 4)
    end

    @quality = 0 if @quality < 0
    @sell_in -= 1
  end
end
