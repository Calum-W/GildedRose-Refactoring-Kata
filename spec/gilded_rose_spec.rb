require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "calls the method update_quality on each item" do
      item = double(:item, update_quality: "method called")
      item2 = double(:item, update_quality: "method called")
      gr = GildedRose.new([item, item2])
      gr.update_quality()
      expect(item).to have_received(:update_quality)
      expect(item2).to have_received(:update_quality)
    end
  end
end
