require 'oystercard'
describe Oystercard do

    it 'gets an instance of Oystercard' do
        oyster = Oystercard.new
        expect(oyster).to be_instance_of Oystercard
    end
end