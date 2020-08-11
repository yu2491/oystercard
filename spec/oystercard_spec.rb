require 'oystercard'
describe Oystercard do
  let(:station) { double("station") }

  describe '#initialize' do
    it "oystercard balance is initialized to 0" do
        expect(subject.balance).to eq 0
    end

    it "Return empty journey list" do 
      expect(subject.journey_list).to eq [] 
    end

    it "Checks if one journey is made" do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject.journey_list.count).to eq 1
    end

  end

  describe '#top_up' do
    it 'increases balance by amount when called' do
      expect { subject.top_up(10) }.to change { subject.balance }.by(10)
    end

    it 'raises an error if amount exceeds max balance' do
      max_balance = Oystercard::MAX_BALANCE
      subject.top_up(max_balance)
      expect { subject.top_up(1) }.to  raise_error ("DENIED: Max balance is #{max_balance}")
    end
  end

  it 'initialy is not in journey' do
    expect(subject).not_to be_in_journey
  end

  describe '#touch_in' do

    it "updates journey to true" do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

    it "should raise error if insufficient balance" do
      expect{ subject.touch_in(station) }.to raise_error ('Insuffient funds available')
    end

    it "record entry station to card" do
      subject.top_up(10)
      expect(subject.touch_in(station)).to eq station
    end
  end

  describe '#touch_out' do
    it 'updates journey to false' do
      subject.touch_out(station)
      expect(subject).not_to be_in_journey
    end

    it "deducts fare from balance" do
      subject.top_up(10)
      expect { subject.touch_out(station) }.to change { subject.balance }.by(-Oystercard::MIN_FARE)
    end
  end


end
