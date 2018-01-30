require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    context "Sulfuras" do

      it 'does not change the sell_in value of Sulfuras' do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 10
      end

      fit 'does not change the quality of Sulfuras' do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 10
      end

      context "Aged Brie" do

      end

      context "Backstage passes" do

      end

      context "Other item" do

      end
    end
  end
end
