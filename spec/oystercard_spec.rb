require 'oystercard'
describe Oystercard do

    it 'gets an instance of Oystercard' do
        oyster = Oystercard.new
        expect(oyster).to be_instance_of Oystercard
    end

  describe '#initialize' do
    it "oystercard balance is initialized to 0" do
        expect(subject.balance).to eq 0
    end
  end
end