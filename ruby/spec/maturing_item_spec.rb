require 'maturing_item'

describe "Maturing item" do
  describe "#update_quality" do
    max = Item::MAX_QUALITY

    it "increases Brie's quality by one if sell_in is above 0" do
      cheese = MaturingItem.new(name: "Aged Brie", sell_in: 10, quality: 10)
      expect { cheese.update_quality() }.to change { cheese.quality }.by(1)
    end

    it "increases Brie's quality by two if sell_in is 0 or below" do
      cheese = MaturingItem.new(name: "Aged Brie", sell_in: 0, quality: 10)
      expect { cheese.update_quality() }.to change { cheese.quality }.by(2)
    end

    it "doesn't increase Brie's quality if already at max" do
      cheese = MaturingItem.new(name: "Aged Brie", sell_in: 10, quality: max)
      expect { cheese.update_quality() }.to change { cheese.quality }.by(0)
    end

    it "doesn't increase Brie's quality if already at max and sell_in is 0 or below" do
      cheese = MaturingItem.new(name: "Aged Brie", sell_in: 0, quality: max)
      expect { cheese.update_quality() }.to change { cheese.quality }.by(0)
    end

    it "reduces Brie's sell_in by one" do
      cheese = MaturingItem.new(name: "Aged Brie", sell_in: 10, quality: 50)
      expect { cheese.update_quality() }.to change { cheese.sell_in }.by(-1)
    end
  end
end
