require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "doesn't change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    context "Sulfuras" do

      it "doesn't change the sell_in value of Sulfuras" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 10
      end

      it "doesn't change the quality of Sulfuras" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 10
      end
    end

    context "Aged Brie" do
      context "Quality" do
        it "increases Brie's quality by one if sell_in is above 0" do
          items = [Item.new("Aged Brie", 10, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 11
        end

        it "increases Brie's quality by two if sell_in is 0 or below" do
          items = [Item.new("Aged Brie", 0, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 12
        end

        it "shouldn't increase Brie's quality if already at 50" do
          items = [Item.new("Aged Brie", 10, 50)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 50
        end

        it "shouldn't increase Brie's quality if already at 50 and sell_in is 0 or below" do
          items = [Item.new("Aged Brie", 0, 50)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 50
        end
      end
      context "Sell_in" do
        it "reduces Brie's sell_in by one" do
          items = [Item.new("Aged Brie", 10, 50)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 9
        end
      end
    end

    context "Backstage passes (BSP)" do
      context "Quality" do
        it "increase quality by two if sell_in is between 6-10" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 12
        end

        it "increase quality by three if sell_in is between 1-5" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 13
        end

        it "sets quality to 0 if sell_in is 0 or below" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 0
        end

        it "doesn't increase the value above 50 when sell_in is above 10" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 50)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 50
        end

        it "doesn't increase the value above 50 when sell_in is between 6-10" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 8, 50)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 50
        end

        it "doesn't increase the value above 50 when sell_in is between 1-5" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 50)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 50
        end
      end

      context "Sell_in" do
        it "reduces BSP sell_in by one" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 50)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 9
        end
      end
    end

    context "Other item" do
      context "Quality" do
        it "reduces the quality by one if sell_in is above 0" do
          items = [Item.new("Charles's hat", 1, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 9
        end

        it "reduces the quality by two if sell_in is 0 or below" do
          items = [Item.new("Charles's hat", 0, 10)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 8
        end

        it "doesn't reduce the quality if already at 0" do
          items = [Item.new("Charles's hat", 5, 0)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 0
        end

        it "doesn't reduce the quality if already at 0 and sell_in is 0 or below" do
          items = [Item.new("Charles's hat", 0, 0)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 0
        end

        it "reduces the quality to 0 if currently at 1 and sell_in is 0 or below" do
          items = [Item.new("Charles's hat", 0, 1)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 0
        end
      end

      context "Sell_in" do
        it "reduces sell_in by one" do
          items = [Item.new("Joe's duck", 10, 50)]
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq 9
        end
      end
    end
  end
end
