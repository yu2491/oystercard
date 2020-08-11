require "journey"

describe Journey do 

  it "starts the journey" do 
    card = double("card", :touch_in => "Old Street")
    expect(subject.start).to eq "Old Street"
  end


end