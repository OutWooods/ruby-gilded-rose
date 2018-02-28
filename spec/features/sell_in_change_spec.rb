require './src/gilded_rose'
require './src/item'

describe 'update quality' do
  subject(:sulfras) { Item.new('Sulfuras, Hand of Ragnaros', 1, 10) }

  describe '#sell_in' do
    it 'should reduce normal foods by default amount' do
      rocket = rocket(10, 10)
      rose = GildedRose.new([rocket])
      expect { rose.update_quality }.to change {
        rocket.sell_in
      }.by(-1)
    end

    it 'should reduce off foods by default amount' do
      rocket = rocket(0, 10)
      rose = GildedRose.new([rocket])
      expect { rose.update_quality }.to change { rocket.sell_in }.by(-1)
    end

    it 'should reduce aged brie\'s sell in by the normal amount' do
      brie = brie(0, 10)
      rose = GildedRose.new([brie])
      expect { rose.update_quality }.to change { brie.sell_in }.by(-1)
    end

    it 'should not reduce aged sulfuras\'s sell in' do
      rose = GildedRose.new([sulfras])
      expect { rose.update_quality }.not_to change {
        sulfras.sell_in
      }
    end
  end
end
