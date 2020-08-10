require 'oystercard'
describe Oystercard do

  describe '#initialize' do
    it "oystercard balance is initialized to 0" do
        expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'changes balance by amount when called' do
      expect { subject.top_up(10) }.to change { subject.balance }.by(10)
    end

    it 'raises an error if amount exceeds max balance' do
      expect { subject.top_up(100) }.to  raise_error ('DENIED: Maximum balance exceeded')
    end
  end

end
