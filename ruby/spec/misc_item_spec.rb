require 'misc_item'

describe "Misc item" do
  describe "Update_quality" do
    it "reduces the quality by one if sell_in is above 0" do
      item = MiscItem.new(1, 10)
      item.update_quality()
      expect(item.quality).to eq 9
    end

    it "reduces the quality by two if sell_in is 0 or below" do
      item = MiscItem.new(0, 10)
      item.update_quality()
      expect(item.quality).to eq 8
    end

    it "doesn't reduce the quality if already at 0" do
      item = MiscItem.new(5, 0)
      item.update_quality()
      expect(item.quality).to eq 0
    end

    it "doesn't reduce the quality if already at 0 and sell_in is 0 or below" do
      item = MiscItem.new(0, 0)
      item.update_quality()
      expect(item.quality).to eq 0
    end

    it "reduces the quality to 0 if currently at 1 and sell_in is 0 or below" do
      item = MiscItem.new(0, 1)
      item.update_quality()
      expect(item.quality).to eq 0
    end

    context "Sell_in" do
      it "reduces sell_in by one" do
        item = MiscItem.new(10, 50)
        item.update_quality()
        expect(item.sell_in).to eq 9
      end
    end
  end

  describe "#to_s" do
    it "should return a string containing the item's class, sell_in and quality" do
      rubber_duck = MiscItem.new(5, 9)
      expect(rubber_duck.to_s).to eq "MiscItem, 5, 9"
    end
  end
end
