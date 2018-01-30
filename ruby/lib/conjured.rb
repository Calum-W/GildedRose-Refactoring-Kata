require_relative 'Item'

class Conjured < Item

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
