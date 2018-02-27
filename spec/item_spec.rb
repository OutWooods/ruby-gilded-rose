require './src/item'

describe Item do

  describe '#initialize' do
    it 'should store a name' do
      item = Item.new('Food', 'Another', 'Thing')
      expect(item.name).to eq 'Food'
    end

    it 'should store a food' do
      item = Item.new('Food', 'Another', 'Thing')
      expect(item.name).to eq 'Food'
    end

    it 'should store a sell_in' do
      item = Item.new('Food', 'When', 'Thing')
      expect(item.sell_in).to eq 'When'
    end

    it 'should store a quality' do
      item = Item.new('Food', 'When', 'Standard')
      expect(item.quality).to eq 'Standard'
    end
  end

end
