class Oystercard

    def initialize
        @balance = 0
        @in_use = false
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
        @in_use
    end

    def touch_in
        @in_use = true
    end
    
    def touch_out
        @in_use = false
    end
end
