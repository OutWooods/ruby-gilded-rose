require './src/item'

describe Item do

  describe '#initialize' do
    it 'should store a food' do
      item = Item.new('Food', 'Another', 'Thing')
      expect(item.name).to eq 'Food'
    end
  end

end
