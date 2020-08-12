require "journey"

describe Journey do

  let(:station) { double('station') }

  it 'knows if a journey is not complete' do
    expect(subject).not_to be_complete
  end

  it 'if we have an entry station but not an exit station, complete method returns false' do
    journey = Journey.new
    journey.start_station = "old street"
    expect(journey.complete?).to eq(false)
  end

  it 'charges a penalty fare if journey has not been completed' do
    expect(subject.calculate_fare).to eq(Journey::PENALTY_FEE)
  end

  it 'charges minimum fare if the journey has been completed' do
    journey = Journey.new
    journey.start_station = "Station"
    journey.end_station = "Station 2"
    expect(journey.calculate_fare).to eq(1)
  end

  it 'checks that the default of the complete method is false' do
    expect(subject.complete?).to eq(false)
  end

end
