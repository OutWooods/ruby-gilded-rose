require './src/gilded_rose'
require './src/item'

describe 'changes to sell in' do
  subject(:rocket) { Item.new('Rocket', 10, 10) }
  subject(:off_rocket) { Item.new('Rocket', 0, 10) }
  subject(:rose) { GildedRose.new([rocket, off_rocket]) }
  subject(:brie) { Item.new('Aged Brie', 1, 10) }

  describe '#sell_in' do
    it 'should reduce normal foods by default amount' do
      expect { rose.update_quality }.to change { rocket.sell_in }.by(-1)
    end

    it 'should reduce off foods by default amount' do
      expect { rose.update_quality }.to change { off_rocket.sell_in }.by(-1)
    end

    it 'should reduce aged brie\'s sell in by the normal amount' do
      single_rose = GildedRose.new([brie])
      expect { single_rose.update_quality }.to change { brie.sell_in }.by(-1)
    end

  end
end
