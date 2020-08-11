class Oystercard

  def initialize
    @balance = 0
    @in_journey = false
  end

  attr_reader :balance

  MAX_BALANCE = 90
  MIN_FARE = 1

  def top_up(amount)
    fail "DENIED: Max balance is #{MAX_BALANCE}" if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in(station)
    fail "Insuffient funds available" if balance < MIN_FARE
    @in_journey = true
    station
  end

  def touch_out
    deduct(MIN_FARE)
    @in_journey = false
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
