require 'depreciating_item'

describe "Depreciating item" do
  max = Item::MAX_QUALITY
  min = Item::MIN_QUALITY

  describe "#update_quality" do
    it "increases quality by one if sell_in is above 10" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 11, quality: 10)
      expect { bsp.update_quality() }.to change { bsp.quality }.by(1)
    end

    it "increases quality by two if sell_in is between 6-10 (max)" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 10, quality: 10)
      expect { bsp.update_quality() }.to change { bsp.quality }.by(2)
    end

    it "increases quality by two if sell_in is between 6-10 (min)" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 6, quality: 10)
      expect { bsp.update_quality() }.to change { bsp.quality }.by(2)
    end

    it "increases quality by three if sell_in is between 1-5 (max)" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 5, quality: 10)
      expect { bsp.update_quality() }.to change { bsp.quality }.by(3)
    end

    it "increases quality by three if sell_in is between 1-5 (min)" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 1, quality: 10)
      expect { bsp.update_quality() }.to change { bsp.quality }.by(3)
    end

    it "sets quality to 0 if sell_in is 0 or below" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 0, quality: 10)
      bsp.update_quality()
      expect(bsp.quality).to eq 0
    end

    it "doesn't increase the value above max when sell_in is above 10" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 11, quality: max)
      expect { bsp.update_quality() }.to change { bsp.quality }.by(0)
    end

    it "doesn't increase the value above max when sell_in is between 6-10 (min)" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 6, quality: max)
      expect { bsp.update_quality() }.to change { bsp.quality }.by(0)
    end

    it "doesn't increase the value above max when sell_in is between 6-10 (max)" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 10, quality: max)
      expect { bsp.update_quality() }.to change { bsp.quality }.by(0)
    end

    it "doesn't increase the value above max when sell_in is between 1-5 (min)" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 1, quality: max)
      expect { bsp.update_quality() }.to change { bsp.quality }.by(0)
    end

    it "doesn't increase the value above max when sell_in is between 1-5 (max)" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 5, quality: max)
      expect { bsp.update_quality() }.to change { bsp.quality }.by(0)
    end

    it "only increases the value to max when sell_in is between 1-5 (min)" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 1, quality: max - 2)
      expect { bsp.update_quality() }.to change { bsp.quality }.by(2)
    end

    it "only increases the value to max when sell_in is between 1-5 (max)" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 5, quality: max - 2)
      expect { bsp.update_quality() }.to change { bsp.quality }.by(2)
    end

    it "reduces sell_in by one" do
      bsp = DepreciatingItem.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 10, quality: max)
      expect { bsp.update_quality() }.to change { bsp.sell_in }.by(-1)
    end
  end
end
