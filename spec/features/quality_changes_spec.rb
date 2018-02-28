require './src/gilded_rose'
require './src/item'
require './spec/features/feature_helper'

describe 'quality ' do
  let(:max_quality) { GildedRose::MAX_QUALITY }
  let(:min_quality) { GildedRose::MIN_QUALITY}
  let(:default_improvement) { GildedRose::DEFAULT_IMPROVEMENT }
  let(:default_depreciation) { GildedRose::DEFAULT_DEPRECIATION}

  describe '#quality' do
    describe 'normal' do
      it 'should reduce foods quality within sell_in by default amount' do
        rocket = rocket(10, 10)
        rose = GildedRose.new([rocket])
        change = GildedRose::DEFAULT_DEPRECIATION
        expect { rose.update_quality }.to change { rocket.quality }.by(change)
      end

      it 'should reduce food outside sell_in by twice the normal amount' do
        rocket = rocket(0, 10)
        rose = GildedRose.new([rocket])
        change = GildedRose::DEFAULT_DEPRECIATION * 2
        expect { rose.update_quality }.to change { rocket.quality }.by(change)
      end

      it 'should not reduce a normal foods quality below 0' do
        rocket = rocket(10, min_quality)
        rose = GildedRose.new([rocket])
        rose.update_quality
        expect(rocket.quality).to be >= min_quality
      end

      it 'should not reduce off normal foods quality below 0' do
        rocket = rocket(0, 1)
        rose = GildedRose.new([rocket])
        rose.update_quality
        expect(rocket.quality).to eq min_quality
      end
    end

    describe 'Aged Brie' do
      it 'should increase quality of Brie' do
        brie = brie(10, 10)
        rose = GildedRose.new([brie])
        rose.update_quality
        expect { rose.update_quality }.to change {
          brie.quality
         }.by( default_improvement)
      end

      it 'should increase quality of even when its passed sell_in Brie' do
        brie = brie(0, min_quality)
        rose = GildedRose.new([brie])
        rose.update_quality
        expect { rose.update_quality }.to change { brie.quality }.by(2)
      end

      it 'should never let Bries quality rise above Max quality' do
        brie = brie(max_quality, max_quality)
        rose = GildedRose.new([brie])
        rose.update_quality
        expect(brie.quality).to be <= max_quality
      end

      it 'should never let Bries quality rise beyond fifty, even after sell in' do
        brie = brie(-1, 49)
        rose = GildedRose.new([brie])
        rose.update_quality
        expect(brie.quality).to eq max_quality
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
          pass = pass(11, 40)
          rose = GildedRose.new([pass])
          expect { rose.update_quality }.to change {
             pass.quality
           }.by default_improvement
        end

        it 'backstage pass goes up by 2 when there are 10 days left' do
          pass = pass(10, 30)
          rose = GildedRose.new([pass])
          expect { rose.update_quality }.to change { pass.quality }.by 2
        end

        it 'backstage pass goes up by 2 when there are 6 days left' do
          change = default_improvement * 2
          pass = pass(6, 30)
          rose = GildedRose.new([pass])
          expect { rose.update_quality }.to change { pass.quality }.by change
        end

        it 'backstage pass goes up by 3 when there are 5 days left' do
          change = default_improvement  * 3
          pass = pass(5, 30)
          rose = GildedRose.new([pass])
          expect { rose.update_quality }.to change { pass.quality }.by change
        end

        it 'backstage pass goes up by 3 when there is 1 day left' do
          change = default_improvement  * 3
          pass = pass(5, 30)
          rose = GildedRose.new([pass])
          expect { rose.update_quality }.to change { pass.quality }.by change
        end

        it 'backstage pass does not go up past max_quality when there are > 10 days left' do
          pass = pass(13, max_quality)
          rose = GildedRose.new([pass])
          expect { rose.update_quality }.to_not change { pass.quality }
        end

        it 'backstage pass does not got past max_quality when 3 < x > 10 days left' do
          pass = pass(10, 49)
          rose = GildedRose.new([pass])
          rose.update_quality
          expect(pass.quality).to eq max_quality
        end

        it 'backstage pass does not go up past max_quality when there are > 3 days left' do
          pass = pass(2, 48)
          rose = GildedRose.new([pass])
          rose.update_quality
          expect(pass.quality).to eq max_quality
        end

        it 'back stage pass should go down to 0 after concert' do
          backstage_pass = pass(0, max_quality)
          rose = GildedRose.new([backstage_pass])
          rose.update_quality
          expect(backstage_pass.quality).to eq min_quality
        end
      end
  end
end
