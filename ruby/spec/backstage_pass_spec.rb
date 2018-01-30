require 'backstage_pass'

describe "Backstage pass" do
  describe "update_quality" do
    it "increase quality by two if sell_in is between 6-10" do
      bsp = BackstagePass.new(10, 10)
      bsp.update_quality()
      expect(bsp.quality).to eq 12
    end

    it "increase quality by three if sell_in is between 1-5" do
      bsp = BackstagePass.new(1, 10)
      bsp.update_quality()
      expect(bsp.quality).to eq 13
    end

    it "sets quality to 0 if sell_in is 0 or below" do
      bsp = BackstagePass.new(0, 10)
      bsp.update_quality()
      expect(bsp.quality).to eq 0
    end

    it "doesn't increase the value above 50 when sell_in is above 10" do
      bsp = BackstagePass.new(11, 50)
      bsp.update_quality()
      expect(bsp.quality).to eq 50
    end

    it "doesn't increase the value above 50 when sell_in is between 6-10 (min)" do
      bsp = BackstagePass.new(6, 50)
      bsp.update_quality()
      expect(bsp.quality).to eq 50
    end

    it "doesn't increase the value above 50 when sell_in is between 6-10 (max)" do
      bsp = BackstagePass.new(10, 50)
      bsp.update_quality()
      expect(bsp.quality).to eq 50
    end

    it "doesn't increase the value above 50 when sell_in is between 1-5 (min)" do
      bsp = BackstagePass.new(1, 50)
      bsp.update_quality()
      expect(bsp.quality).to eq 50
    end

    it "doesn't increase the value above 50 when sell_in is between 1-5 (max)" do
      bsp = BackstagePass.new(5, 50)
      bsp.update_quality()
      expect(bsp.quality).to eq 50
    end
  end

  context "Sell_in" do
    it "reduces BSP sell_in by one" do
      bsp = BackstagePass.new(10, 50)
      bsp.update_quality()
      expect(bsp.sell_in).to eq 9
    end
  end
end
