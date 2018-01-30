require 'conjured'

describe "Conjured" do
  describe "#update_quality" do
    it "reduces quality by 2 if sell_in is above 0" do
      conjured_staff = Conjured.new("Conjured staff",10,10)
      conjured_staff.update_quality()
      expect(conjured_staff.quality).to eq 8
    end

    it "reduces quality by 4 if sell_in is 0 or below" do
      conjured_staff = Conjured.new("Conjured staff",0,10)
      conjured_staff.update_quality()
      expect(conjured_staff.quality).to eq 6
    end

    it "doesn't reduce quality past 0" do
      conjured_staff = Conjured.new("Conjured staff",10,0)
      conjured_staff.update_quality()
      expect(conjured_staff.quality).to eq 0
    end

    it "doesn't reduce quality past 0 if sell_in is 0 or below" do
      conjured_staff = Conjured.new("Conjured staff",0,0)
      conjured_staff.update_quality()
      expect(conjured_staff.quality).to eq 0
    end

    it "reduces quality only to 0 if current quality is below 2" do
      conjured_staff = Conjured.new("Conjured staff",10,1)
      conjured_staff.update_quality()
      expect(conjured_staff.quality).to eq 0
    end

    it "reduces quality only to 0 if current quality is below 4 and sell_in is 0 or below" do
      conjured_staff = Conjured.new("Conjured staff",0,1)
      conjured_staff.update_quality()
      expect(conjured_staff.quality).to eq 0
    end
  end

  describe "#to_s" do
    it "should return a string containing the item's name, sell_in and quality" do
      conjured_staff = Conjured.new("Conjured staff", 5, 9)
      expect(conjured_staff.to_s).to eq "Conjured staff, 5, 9"
    end
  end
end
