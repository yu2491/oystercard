class Journey

  attr_accessor :start_station, :end_station

  PENALTY_FEE = 6

  def initlialize(station)
    @start_station = station
    @end_station
  end

  def complete?
    !!@start_station && !!@end_station
  end

  def calculate_fare

    complete? ? 1 : PENALTY_FEE

  end

  def finish(station)
    @end_station = station
  end
end
