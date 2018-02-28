require './src/gilded_rose'
require './src/item'
require './spec/features/feature_helper'

describe 'quality ' do
  describe '#quality' do
    describe 'normal' do
      it 'should reduce normal foods quality within sell_in by default amount' do
        rocket = rocket(10, 10)
        rose = GildedRose.new([rocket])
        expect { rose.update_quality }.to change { rocket.quality }.by(-1)
      end

      it 'should reduce food outside sell_in by twice the normal amount' do
        rocket = rocket(0, 10)
        rose = GildedRose.new([rocket])
        expect { rose.update_quality }.to change { rocket.quality }.by(-2)
      end

      it 'should not reduce a normal foods quality below 0' do
        rocket = rocket(10, 0)
        rose = GildedRose.new([rocket])
        rose.update_quality
        expect(rocket.quality).to be >= 0
      end

      it 'should not reduce off normal foods quality below 0' do
        rocket = rocket(0, 1)
        rose = GildedRose.new([rocket])
        rose.update_quality
        expect(rocket.quality).to eq 0
      end
    end

    describe 'Aged Brie' do
      it 'should increase quality of Brie' do
        brie = brie(10, 10)
        rose = GildedRose.new([brie])
        rose.update_quality
        expect { rose.update_quality }.to change { brie.quality }.by(1)
      end

      it 'should increase quality of even when its passed sell_in Brie' do
        brie = brie(0, 0)
        rose = GildedRose.new([brie])
        rose.update_quality
        expect { rose.update_quality }.to change { brie.quality }.by(2)
      end

      it 'should never let Bries quality rise above 50' do
        brie = brie(50, 50)
        rose = GildedRose.new([brie])
        rose.update_quality
        expect(brie.quality).to be <= 50
      end

      it 'should never let Bries quality rise beyond fifty, even after sell in' do
        brie = brie(-1, 49)
        rose = GildedRose.new([brie])
        rose.update_quality
        expect(brie.quality).to eq 50
      end
    end
    describe 'Sulfras' do
      it 'should not change sulfras\'s quality' do
        sulfras = Item.new('Sulfuras, Hand of Ragnaros', 10, 80)
        rose = GildedRose.new([sulfras])
        expect { rose.update_quality }.not_to change { sulfras.quality }
      end
    end
    describe 'Backstage pass' do
        it 'backstage pass goes up by 1 when there are > 10 days left' do
          pass = Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 40)
          rose = GildedRose.new([pass])
          expect { rose.update_quality }.to change { pass.quality }.by 1
        end

        it 'backstage pass goes up by 2 when there are 10 days left' do
          pass = Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 30)
          rose = GildedRose.new([pass])
          expect { rose.update_quality }.to change { pass.quality }.by 2
        end

        it 'backstage pass goes up by 2 when there are 6 days left' do
          pass = Item.new('Backstage passes to a TAFKAL80ETC concert', 6, 30)
          rose = GildedRose.new([pass])
          expect { rose.update_quality }.to change { pass.quality }.by 2
        end

        it 'backstage pass goes up by 3 when there are 5 days left' do
          pass = Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 30)
          rose = GildedRose.new([pass])
          expect { rose.update_quality }.to change { pass.quality }.by 3
        end

        it 'backstage pass goes up by 3 when there is 1 day left' do
          pass = Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 30)
          rose = GildedRose.new([pass])
          expect { rose.update_quality }.to change { pass.quality }.by 3
        end

        it 'backstage pass does not go up past 50 when there are > 10 days left' do
          pass = Item.new('Backstage passes to a TAFKAL80ETC concert', 13, 50)
          rose = GildedRose.new([pass])
          expect { rose.update_quality }.to_not change { pass.quality }
        end

        it 'backstage pass does not got past 50 when 3 < x > 10 days left' do
          pass = Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 49)
          rose = GildedRose.new([pass])
          rose.update_quality
          expect(pass.quality).to eq 50
        end

        it 'backstage pass does not go up past 50 when there are > 3 days left' do
          pass = Item.new(
            'Backstage passes to a TAFKAL80ETC concert', 2, 48
          )
          rose = GildedRose.new([pass])
          rose.update_quality
          expect(pass.quality).to eq 50
        end

        it 'back stage pass should go down to 0 after concert' do
          backstage_pass = Item.new(
            'Backstage passes to a TAFKAL80ETC concert', 0, 50
          )
          rose = GildedRose.new([backstage_pass])
          rose.update_quality
          expect(backstage_pass.quality).to eq 0
        end
      end
  end
end
