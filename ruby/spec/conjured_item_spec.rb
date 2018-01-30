require 'conjured_item'

describe "Conjured item" do
  max = Item::MAX_QUALITY
  min = Item::MIN_QUALITY

  describe "#update_quality" do
    it "reduces quality by 2 if sell_in is above 0" do
      conjured_staff = ConjuredItem.new(name: "Conjured staff", sell_in: 10, quality: 10)
      expect { conjured_staff.update_quality() }.to change { conjured_staff.quality }.by(-2)
    end

    it "reduces quality by 4 if sell_in is 0 or below" do
      conjured_staff = ConjuredItem.new(name: "Conjured staff", sell_in: 0, quality: 10)
      expect { conjured_staff.update_quality() }.to change { conjured_staff.quality }.by(-4)
    end

    it "doesn't reduce quality past min" do
      conjured_staff = ConjuredItem.new(name: "Conjured staff", sell_in: 10, quality: min)
      expect { conjured_staff.update_quality() }.to change { conjured_staff.quality }.by(0)
    end

    it "doesn't reduce quality past min if sell_in is 0 or below" do
      conjured_staff = ConjuredItem.new(name: "Conjured staff", sell_in: 0, quality: min)
      expect { conjured_staff.update_quality() }.to change { conjured_staff.quality }.by(0)
    end

    it "only reduces quality only to min" do
      conjured_staff = ConjuredItem.new(name: "Conjured staff", sell_in: 10, quality: min + 1)
      conjured_staff.update_quality()
      expect(conjured_staff.quality).to eq 0
    end

    it "reduces quality only to min if sell_in is 0 or below" do
      conjured_staff = ConjuredItem.new(name: "Conjured staff", sell_in: 0, quality: min + 1)
      conjured_staff.update_quality()
      expect(conjured_staff.quality).to eq 0
    end

    it "reduces sell_in by one" do
      staff = ConjuredItem.new(name: "Conjured staff", sell_in: 10, quality: max)
      expect { staff.update_quality() }.to change { staff.sell_in }.by(-1)
    end
  end
end
