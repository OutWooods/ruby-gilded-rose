require './src/gilded_rose'
require './src/item'

describe 'changes to sell in' do
  subject(:rocket) { Item.new('Rocket', 10, 10) }
  subject(:off_rocket) { Item.new('Rocket', 0, 10) }
  subject(:brie) { Item.new('Aged Brie', 0, 10) }
  subject(:sulfras) { Item.new("Sulfuras, Hand of Ragnaros", 1, 10) }
  subject(:rose) { GildedRose.new([rocket, off_rocket]) }

  describe '#sell_in' do
    it 'should reduce normal foods by default amount' do
      single_rose = GildedRose.new([rocket])
      expect { rose.update_quality }.to change { rocket.sell_in }.by(-1)
    end

    it 'should reduce off foods by default amount' do
      single_rose = GildedRose.new([off_rocket])
      expect { rose.update_quality }.to change { off_rocket.sell_in }.by(-1)
    end

    it 'should reduce aged brie\'s sell in by the normal amount' do
      single_rose = GildedRose.new([brie])
      expect { single_rose.update_quality }.to change { brie.sell_in }.by(-1)
    end

    it 'should not reduce aged sulfuras\'s sell in' do
      single_rose = GildedRose.new([sulfras])
      expect { single_rose.update_quality }.not_to change { sulfras.sell_in }
    end

  end
end
