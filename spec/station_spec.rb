require 'station'

describe Station do

  it "station exists" do
    station = Station.new
    expect(station).to be_an_instance_of(Station)
  end

end
