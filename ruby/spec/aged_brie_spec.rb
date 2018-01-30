require 'aged_brie'

describe "Aged Brie" do
  describe "update_quality" do
    it "increases Brie's quality by one if sell_in is above 0" do
      cheese = AgedBrie.new(10, 10)
      cheese.update_quality()
      expect(cheese.quality).to eq 11
    end

    it "increases Brie's quality by two if sell_in is 0 or below" do
      cheese = AgedBrie.new(0, 10)
      cheese.update_quality()
      expect(cheese.quality).to eq 12
    end

    it "doesn't increase Brie's quality if already at 50" do
      cheese = AgedBrie.new(10, 50)
      cheese.update_quality()
      expect(cheese.quality).to eq 50
    end

    it "doesn't increase Brie's quality if already at 50 and sell_in is 0 or below" do
      cheese = AgedBrie.new(0, 50)
      cheese.update_quality()
      expect(cheese.quality).to eq 50
    end
  end
  context "Sell_in" do
    it "reduces Brie's sell_in by one" do
      cheese = AgedBrie.new(10, 50)
      cheese.update_quality()
      expect(cheese.sell_in).to eq 9
    end
  end

  describe "#to_s" do
    it "should return a string containing the item's class, sell_in and quality" do
      axe = AgedBrie.new(5, 9)
      expect(axe.to_s).to eq "AgedBrie, 5, 9"
    end
  end
end
