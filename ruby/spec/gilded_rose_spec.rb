require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it 'does not reduce the sell_in value of Sulfuras' do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 10
    end
  end

end
