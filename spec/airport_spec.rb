require 'airport'
require 'weather'

describe Airport do

  let(:airport) {Airport.new}
  let(:plane) {Plane.new}

  it 'expect airport to be a kind of Airport' do
    expect(airport).to be_a_kind_of(Airport)
  end

  it 'expect airport to respond to the land method' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'expect airport to respond to show_planes' do
    expect(airport).to respond_to(:show_planes)
  end

  it 'expects a plane to be able to land at the airport' do
    output = airport.land(plane)
    expect(airport.show_planes.length).to eq(1)
  end

  it 'expects a plane to be able to take off from the airport' do
    airport.land(plane)
    airport.plane_takeoff
    expect(airport.show_planes.length).to eq(1)
  end

  it 'expects airport to respond to weather' do
    allow(airport).to receive(:weater) { "STORMY" }
  end

  it 'expects a plane not to be able to land at the airport when the airport is full' do
    airport.land(plane)
    airport.land(plane)
    airport.land(plane)
    airport.land(plane)
    expect(airport.land(plane)).to eq("There's no more space on the runway")
  end

  it 'plane is not allowed to take off if the weather is stormy' do
    allow(airport).to receive(:weather) { "STORMY" }
    expect{airport.plane_takeoff}.to raise_error("Sorry, the weather is stormy")
  end

  it 'plane can take off if the weather is sunny' do
    5.times { airport.land(plane) }
    airport.plane_takeoff
    airport.stub(:weather) { "SUNNY" }
    #allow(airport).to receive(:weather) { "SUNNY" }
    expect(airport.show_planes.length).to eq(4)
  end

end
