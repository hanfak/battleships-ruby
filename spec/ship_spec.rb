require 'ship'

describe Ship do
  subject(:ship) {described_class.new}

  describe '#initialize' do
    it "by default has size of 1" do
      expect(ship.size).to eq 1
    end

    it 'can change the size of the ship' do
      expect(Ship.new(2).size).to eq 2
    end

    it 'has no position' do
      expect(ship.position).to eq []
    end
  end

  describe '#store_location' do
    it 'stores one part of the ship location' do
      ship.get_location(3,5)

      expect(ship.position).to eq [[3,5]]
    end

    it 'stores one part of the ship location' do
      ship.get_location(3,5)
      ship.get_location(3,6)

      expect(ship.position).to eq [[3,5], [3,6]]
    end
  end


end
