require_relative 'journey'

class Oystercard

  def initialize
    @balance = 0
    @entry_station
    @journey_list = []
    @journey
  end

  attr_reader :balance, :entry_station, :journey_list, :journey

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
    @journey = Journey.new(station)
  end

  def touch_out(station)
    @journey.end_station = station
    deduct(@journey.calculate_fare)
    @journey_list << { :entry_station => @entry_station, :exit_station => station }
    @entry_station = nil
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
