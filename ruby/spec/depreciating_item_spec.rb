require 'depreciating_item'

describe "Depreciating item" do
  describe "#update_quality" do
    it "increases quality by one if sell_in is above 10" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 11, quality: 10)
      bsp.update_quality()
      expect(bsp.quality).to eq 11
    end

    it "increases quality by two if sell_in is between 6-10 (max)" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 10, quality: 10)
      bsp.update_quality()
      expect(bsp.quality).to eq 12
    end

    it "increases quality by two if sell_in is between 6-10 (min)" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 6, quality: 10)
      bsp.update_quality()
      expect(bsp.quality).to eq 12
    end

    it "increases quality by three if sell_in is between 1-5 (max)" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 5, quality: 10)
      bsp.update_quality()
      expect(bsp.quality).to eq 13
    end

    it "increases quality by three if sell_in is between 1-5 (min)" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 1, quality: 10)
      bsp.update_quality()
      expect(bsp.quality).to eq 13
    end

    it "sets quality to 0 if sell_in is 0 or below" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 0, quality: 10)
      bsp.update_quality()
      expect(bsp.quality).to eq 0
    end

    it "doesn't increase the value above 50 when sell_in is above 10" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 11, quality: 50)
      bsp.update_quality()
      expect(bsp.quality).to eq 50
    end

    it "doesn't increase the value above 50 when sell_in is between 6-10 (min)" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 6, quality: 50)
      bsp.update_quality()
      expect(bsp.quality).to eq 50
    end

    it "doesn't increase the value above 50 when sell_in is between 6-10 (max)" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 10, quality: 50)
      bsp.update_quality()
      expect(bsp.quality).to eq 50
    end

    it "doesn't increase the value above 50 when sell_in is between 1-5 (min)" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 1, quality: 50)
      bsp.update_quality()
      expect(bsp.quality).to eq 50
    end

    it "doesn't increase the value above 50 when sell_in is between 1-5 (max)" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 5, quality: 50)
      bsp.update_quality()
      expect(bsp.quality).to eq 50
    end

    it "reduces sell_in by one" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 10, quality: 50)
      bsp.update_quality()
      expect(bsp.sell_in).to eq 9
    end
  end
end
