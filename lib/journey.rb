class Journey

  attr_accessor :start_station, :end_station

  PENALTY_FEE = 6

  def initlialize
    @start_station
    @end_station
  end

  def complete?
    !!@start_station && !!@end_station
  end

  def calculate_fare

    complete? ? 1 : PENALTY_FEE

  end
end
