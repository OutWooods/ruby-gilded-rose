require './src/gilded_rose'
require './src/item'

describe 'changes to sell in' do
  subject(:rocket) { Item.new('Rocket', 10, 10) }
  subject(:off_rocket) { Item.new('Rocket', 0, 10) }
  subject(:rose) { GildedRose.new([rocket, off_rocket]) }

  describe '#sell_in' do
    it 'should reduce normal foods by default amount' do
      expect { rose.update_quality }.to change { rocket.sell_in }.by -1
    end
  end
end
