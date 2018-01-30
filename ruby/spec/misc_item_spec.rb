require 'misc_item'

describe "Misc item" do
  describe "#update_quality" do
    it "reduces the quality by one if sell_in is above 0" do
      item = MiscItem.new(name: "Delicious pear", sell_in: 1, quality: 10)
      item.update_quality()
      expect(item.quality).to eq 9
    end

    it "reduces the quality by two if sell_in is 0 or below" do
      item = MiscItem.new(name: "Delicious pear", sell_in: 0, quality: 10)
      item.update_quality()
      expect(item.quality).to eq 8
    end

    it "doesn't reduce the quality if already at 0" do
      item = MiscItem.new(name: "Delicious pear", sell_in: 5, quality: 0)
      item.update_quality()
      expect(item.quality).to eq 0
    end

    it "doesn't reduce the quality if already at 0 and sell_in is 0 or below" do
      item = MiscItem.new(name: "Delicious pear", sell_in: 0, quality: 0)
      item.update_quality()
      expect(item.quality).to eq 0
    end

    it "reduces the quality to 0 if currently at 1 and sell_in is 0 or below" do
      item = MiscItem.new(name: "Delicious pear", sell_in: 0, quality: 1)
      item.update_quality()
      expect(item.quality).to eq 0
    end

    context "Sell_in" do
      it "reduces sell_in by one" do
        item = MiscItem.new(name: "Delicious pear", sell_in: 10, quality: 50)
        item.update_quality()
        expect(item.sell_in).to eq 9
      end
    end
  end
end
