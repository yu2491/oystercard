require "journey"

describe Journey do


  it 'checks if the journey has been completed' do
    expect(subject).not_to be_complete
  end

  it 'charges a penalty fare if journey has not been completed' do
    subject.complete?
    expect(subject.calculate_fare).to eq(6)
  end
  #it 'start_of_journey receives entry_station from Oystercard class' do
  #  expect(subject.start_of_journey).to eq()
#  end

end
