require 'item'

describe "Item" do
  describe "#update_quality" do
    it "doesn't change the sell_in value" do
      sulphuras = Item.new(name: "Sulphuras", sell_in: 10, quality: 10)
      sulphuras.update_quality()
      expect(sulphuras.sell_in).to eq 10
    end

    it "doesn't change the quality" do
      sulphuras = Item.new(name: "Sulphuras", sell_in: 10, quality: 10)
      sulphuras.update_quality()
      expect(sulphuras.quality).to eq 10
    end
  end

  describe "#to_s" do
    it "should return a string containing the item's name, sell_in and quality" do
      axe = Item.new(name: "Axe", sell_in: 5, quality: 9)
      expect(axe.to_s).to eq "Axe, 5, 9"
    end
  end
end
