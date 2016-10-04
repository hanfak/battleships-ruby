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
      expect(ship.position).to eq ({})
    end
  end

  describe '#store_location' do
    it 'stores one part of the ship location' do
      ship.store_location(3,5)

      expect(ship.position).to eq ({[3,5] => :working})
    end

    it 'stores two part of the ship location' do
      ship.store_location(3,5)
      ship.store_location(3,6)

      expect(ship.position).to eq ({[3,5] => :working, [3,6] => :working})
    end
  end

  describe '#change_status' do
    it 'change part location to :hit' do
      ship.store_location(3,5)
      ship.change_status(3,5)

      expect(ship.position[[3,5]]).to eq :hit
    end
  end

  describe '#hit_or_sunk' do
    it 'returns hit if only a part of ship has been hit' do
      allow(ship).to receive(:position).and_return({[3,5]=>:working, [4,5]=>:working, [5,5]=>:hit})

      expect(ship.hit_or_sunk).to eq :hit
    end


    it 'returns ship_sunk if all parts of ship has been hit' do
      allow(ship).to receive(:position).and_return({[0,0]=>:hit, [0,1]=>:hit})

      expect(ship.hit_or_sunk).to eq :ship_sunk
    end
  end
end
