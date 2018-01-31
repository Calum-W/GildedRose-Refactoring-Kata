require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "calls the method update_quality on each item" do
      item = double(:item, update_quality: "method called")
      gr = GildedRose.new([item])
      gr.update_quality()
      expect(item).to have_received(:update_quality)
    end
  end
end
