require_relative 'item.rb'
require_relative 'legendary_item.rb'
require_relative 'maturing_item.rb'
require_relative 'backstage_pass.rb'
require_relative 'misc_item.rb'
require_relative 'conjured_item.rb'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item.update_quality()
    end
  end
end
