require 'conjured'

describe "Conjured" do
  describe "#update_quality" do
    it "reduces quality by 2 if sell_in is above 0" do
      conjured_staff = Conjured.new(10,10)
      conjured_staff.update_quality()
      expect(conjured_staff.quality).to eq 8
    end

    it "reduces quality by 4 if sell_in is 0 or below" do
      conjured_staff = Conjured.new(0,10)
      conjured_staff.update_quality()
      expect(conjured_staff.quality).to eq 6
    end

    it "doesn't reduce quality past 0" do
      conjured_staff = Conjured.new(10,0)
      conjured_staff.update_quality()
      expect(conjured_staff.quality).to eq 0
    end

    it "doesn't reduce quality past 0 if sell_in is 0 or below" do
      conjured_staff = Conjured.new(0,0)
      conjured_staff.update_quality()
      expect(conjured_staff.quality).to eq 0
    end

    it "reduces quality only to 0 if current quality is below 2" do
      conjured_staff = Conjured.new(10,1)
      conjured_staff.update_quality()
      expect(conjured_staff.quality).to eq 0
    end

    it "reduces quality only to 0 if current quality is below 4 and sell_in is 0 or below" do
      conjured_staff = Conjured.new(0,1)
      conjured_staff.update_quality()
      expect(conjured_staff.quality).to eq 0
    end
  end
end
