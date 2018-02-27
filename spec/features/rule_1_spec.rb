require './src/gilded_rose'
require './src/item'

describe 'lowers quality by one on a normal object' do
  subject(:rocket) { Item.new('Rocket', 10, 10) }
  subject(:off_rocket) { Item.new('Rocket', 0, 10) }
  subject(:rose) { GildedRose.new([rocket, off_rocket])}

  describe '#update_quality' do
    describe '#quality' do
      it 'should reduce normal foods quality within sell_in by default amount' do
        expect { rose.update_quality }.to change { rocket.quality }.by -1
      end

      it 'should reduce food outside sell_in by twice the normal amount' do
        quality_reduction = -2
        expect { rose.update_quality }.to change { off_rocket.quality }.by quality_reduction
      end
    end
  end
end
