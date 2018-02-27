require './src/gilded_rose'
require './src/item'

describe 'lowers quality by one on a normal object' do
  subject(:rocket) { Item.new('Rocket', 10, 10) }
  subject(:rose) { GildedRose.new([rocket])}

  describe '#update_quality' do
    it 'should requde food within sell_in by one' do
      expect { rose.update_quality }.to change { rocket.quality }.by -1
    end
  end
end
