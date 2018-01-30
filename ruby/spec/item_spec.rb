require 'item'

describe "Item" do
  describe "#to_s" do
    it "should return a string containing the item's name, sell_in and quality" do
      axe = Item.new(name: "Axe", sell_in: 5, quality: 9)
      expect(axe.to_s).to eq "Axe, 5, 9"
    end
  end
end
