require 'item'

describe "Item" do
  describe "#update_quality" do
    it "doesn't change the sell_in value" do
      sulphuras = Item.new("Sulphuras", 10, 10)
      expect { sulphuras.update_quality() }.to change { sulphuras.sell_in }.by(0)
    end

    it "doesn't change the quality" do
      sulphuras = Item.new("Sulphuras", 10, 10)
      expect { sulphuras.update_quality() }.to change { sulphuras.quality }.by(0)
    end
  end

  describe "#to_s" do
    it "should return a string containing the item's name, sell_in and quality" do
      axe = Item.new("Axe", 5, 9)
      expect(axe.to_s).to eq "Axe, 5, 9"
    end
  end
end
