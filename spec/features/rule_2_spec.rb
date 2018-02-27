require './src/gilded_rose'
require './src/item'

describe 'lowers quality by one on a normal object' do
  subject(:low_quality_rocket) { Item.new('Rocket', 10, 0) }
  subject(:low_quality_off_rocket) { Item.new('Rocket', 0, 1) }
  subject(:rose) { GildedRose.new([rocket, off_rocket]) }

  describe '#quality' do
    it 'should not reduce a normal foods quality below 0' do
      single_rose = GildedRose.new([low_quality_rocket])
      single_rose.update_quality
      expect(low_quality_rocket.quality).to be >= 0
    end

    it 'should not reduce off normal foods quality below 0' do
      single_rose = GildedRose.new([low_quality_off_rocket])
      single_rose.update_quality
      expect(low_quality_off_rocket.quality).to be >= 0
    end
  end
end
