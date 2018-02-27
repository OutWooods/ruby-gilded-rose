require './src/gilded_rose'

describe GildedRose do



  describe "#update_quality" do
    # uncertain about the purpose of this test.
    #Remove later as its not testing much. 
    it "does not change the name" do
      items = double('')
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

   describe "update "
  end

end
