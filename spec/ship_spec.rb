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
  end
end
