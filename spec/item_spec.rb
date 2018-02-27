require './src/item'

describe Item do
  subject(:item) {described_class.new('Food', 'When', 'Standard')}

  describe '#initialize' do
    it 'should store a name' do
      expect(item.name).to eq 'Food'
    end

    it 'should store a sell_in' do
      expect(item.sell_in).to eq 'When'
    end

    it 'should store a quality' do
      expect(item.quality).to eq 'Standard'
    end
  end
end
