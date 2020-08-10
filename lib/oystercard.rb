class Oystercard

    def initialize
        @balance = 0
        
    end

    attr_reader :balance

    MAX_BALANCE = 90

    def top_up(amount)
      fail "DENIED: Max balance is #{MAX_BALANCE}" if balance + amount > MAX_BALANCE
      @balance += amount
    end

    def deduct(amount)
        @balance -= amount
    end

    def in_journey?
        false
    end

end
