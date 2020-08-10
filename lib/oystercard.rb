class Oystercard

    def initialize
        @balance = 0
    end

    attr_reader :balance

    def top_up(amount)
      fail 'DENIED: Maximum balance exceeded' if (@balance += amount) > 90
      @balance
    end


end
