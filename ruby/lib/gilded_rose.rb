class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            # If not Brie, BSP or Sulfuras, lose 1 quality (min 0)
            item.quality = item.quality - 1
          end
        end
      else
        if item.quality < 50
          # Brie and BSP gain 1 quality (max 50)
          item.quality = item.quality + 1

          # BSP gains 1 or 2 quality if sell_in is under 11 or 6 (max 50)
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end

      # non-magical items lose 1 sell_in
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end

      # Sell-in < 0 only below here
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
            # Sell-in < 0. If not Brie, BSP or Sulfuras, lose 1 quality
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          else
            # Sell-in < 0. Backstage pass sets quality to 0
            item.quality = item.quality - item.quality
          end
        else
          # Sell-in < 0. Aged Brie gains 1 quality (max 50)
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
      puts item.quality
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
