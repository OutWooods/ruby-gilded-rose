require './src/gilded_rose'
require './src/item'

describe 'lowers quality by one on a normal object' do
  subject(:rocket) { Item.new('Rocket', 10, 10) }
  subject(:off_rocket) { Item.new('Rocket', 0, 10) }
  subject(:low_quality_rocket) { Item.new('Rocket', 10, 0) }
  subject(:low_quality_off_rocket) { Item.new('Rocket', 0, 1) }

  describe '#quality' do
    it 'should reduce normal foods quality within sell_in by default amount' do
      single_rose = GildedRose.new([rocket])
      expect { single_rose.update_quality }.to change { rocket.quality }.by(-1)
    end

    it 'should reduce food outside sell_in by twice the normal amount' do
      single_rose = GildedRose.new([off_rocket])
      change = -2
      expect { single_rose.update_quality }.to change { off_rocket.quality }.by change
    end

    it 'should not reduce a normal foods quality below 0' do
      single_rose = GildedRose.new([low_quality_rocket])
      single_rose.update_quality
      expect(low_quality_rocket.quality).to be >= 0
    end

    it 'should not reduce off normal foods quality below 0' do
      single_rose = GildedRose.new([low_quality_off_rocket])
      single_rose.update_quality
      expect(low_quality_off_rocket.quality).to eq 0
    end

    it 'should increase quality of Brie' do
      brie = Item.new('Aged Brie', 10, 10)
      single_rose = GildedRose.new([brie])
      single_rose.update_quality
      expect { single_rose.update_quality }.to change { brie.quality }.by(1)
    end

    it 'should increase quality of even when its passed sell_in Brie' do
      brie = Item.new('Aged Brie', 0, 0)
      single_rose = GildedRose.new([brie])
      single_rose.update_quality
      expect { single_rose.update_quality }.to change { brie.quality }.by(2)
    end
  end
end
