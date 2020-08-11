class Oystercard

  def initialize
    @balance = 0
    @entry_station
  end

  attr_reader :balance, :entry_station

  MAX_BALANCE = 90
  MIN_FARE = 1

  def top_up(amount)
    fail "DENIED: Max balance is #{MAX_BALANCE}" if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail "Insuffient funds available" if balance < MIN_FARE
    @entry_station = station
  end

  def touch_out
    deduct(MIN_FARE)
    @entry_station = nil
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
