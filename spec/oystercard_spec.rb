require 'oystercard'
describe Oystercard do

  describe '#initialize' do
    it "oystercard balance is initialized to 0" do
        expect(subject.balance).to eq 0
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

  describe '#deduct' do
    it 'deduct balance by amount when called' do
        subject.top_up(15)
       expect { subject.deduct(10) }.to change { subject.balance }.by(-10)
    end 
  end
  
  
  it 'initialy is not in journey' do
        expect(subject).not_to be_in_journey
     end
   
   describe '#touch_in' do
     it "updates journey to true" do
        subject.touch_in
        expect(subject).to be_in_journey  
     end
    end

end
