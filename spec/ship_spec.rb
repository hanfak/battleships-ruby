require 'ship'

describe Ship do
  subject(:ship) {described_class.new}

  it '#initialize' do
    expect(ship.size).to eq 1
  end
end
