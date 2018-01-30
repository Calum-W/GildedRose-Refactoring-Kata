require 'sulphuras'

describe "Sulfuras" do
  describe "#update_quality" do
    it "doesn't change the sell_in value" do
      sulphuras = Sulphuras.new(10, 10)
      sulphuras.update_quality()
      expect(sulphuras.sell_in).to eq 10
    end

    it "doesn't change the quality" do
      sulphuras = Sulphuras.new(10, 10)
      sulphuras.update_quality()
      expect(sulphuras.quality).to eq 10
    end
  end
end
