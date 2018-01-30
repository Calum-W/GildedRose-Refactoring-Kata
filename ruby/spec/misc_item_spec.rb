require 'misc_item'

describe "Misc item" do
  max = Item::MAX_QUALITY
  min = Item::MIN_QUALITY

  describe "#update_quality" do
    it "reduces the quality by one if sell_in is above 0" do
      item = MiscItem.new(name: "Delicious pear", sell_in: 1, quality: 10)
      expect { item.update_quality() }.to change { item.quality }.by(-1)
    end

    it "reduces the quality by two if sell_in is 0 or below" do
      item = MiscItem.new(name: "Delicious pear", sell_in: 0, quality: 10)
      expect { item.update_quality() }.to change { item.quality }.by(-2)
    end

    it "doesn't reduce the quality if already at min" do
      item = MiscItem.new(name: "Delicious pear", sell_in: 5, quality: min)
      expect { item.update_quality() }.to change { item.quality }.by(0)
    end

    it "doesn't reduce the quality past min and sell_in is 0 or below" do
      item = MiscItem.new(name: "Delicious pear", sell_in: 0, quality: min)
      expect { item.update_quality() }.to change { item.quality }.by(0)
    end

    it "only reduces the quality to min if sell_in is 0 or below" do
      item = MiscItem.new(name: "Delicious pear", sell_in: 0, quality: min + 1)
      item.update_quality()
      expect(item.quality).to eq 0
    end

    it "reduces sell_in by one" do
      item = MiscItem.new(name: "Delicious pear", sell_in: 10, quality: max)
      expect { item.update_quality() }.to change { item.sell_in }.by(-1)
    end
  end
end
