require 'station'

describe Station do

  it "station exists" do
    station = Station.new('name',1)
    expect(station).to be_an_instance_of(Station)
  end

  it "has a name" do
    station = Station.new('name',1)
    expect(station.name).to eq 'name'
  end

  it "has a zone" do
    station = Station.new('name',1)
    expect(station.zone).to eq 1
  end

end
