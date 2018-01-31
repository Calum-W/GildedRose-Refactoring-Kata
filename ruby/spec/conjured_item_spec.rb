require 'conjured_item'

describe "Conjured item" do
  min = Item::MIN_QUALITY

  describe "#update_quality" do
    it "reduces quality by 2 if sell_in is above 0" do
      conjured_staff = ConjuredItem.new("Conjured staff", 10, 10)
      expect { conjured_staff.update_quality() }.to change { conjured_staff.quality }.by(-2)
    end

    it "reduces quality by 4 if sell_in is 0 or below" do
      conjured_staff = ConjuredItem.new("Conjured staff", 0, 10)
      expect { conjured_staff.update_quality() }.to change { conjured_staff.quality }.by(-4)
    end

    it "doesn't reduce quality past min" do
      conjured_staff = ConjuredItem.new("Conjured staff", 10, min)
      expect { conjured_staff.update_quality() }.to change { conjured_staff.quality }.by(0)
    end

    it "doesn't reduce quality past min if sell_in is 0 or below" do
      conjured_staff = ConjuredItem.new("Conjured staff", 0, min)
      expect { conjured_staff.update_quality() }.to change { conjured_staff.quality }.by(0)
    end

    it "only reduces quality only to min" do
      conjured_staff = ConjuredItem.new("Conjured staff", 10, min + 1)
      conjured_staff.update_quality()
      expect(conjured_staff.quality).to eq 0
    end

    it "reduces quality only to min if sell_in is 0 or below" do
      conjured_staff = ConjuredItem.new("Conjured staff", 0, min + 1)
      conjured_staff.update_quality()
      expect(conjured_staff.quality).to eq 0
    end

    it "reduces sell_in by one" do
      staff = ConjuredItem.new("Conjured staff", 10, 10)
      expect { staff.update_quality() }.to change { staff.sell_in }.by(-1)
    end
  end
end
