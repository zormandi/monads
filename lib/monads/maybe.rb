module Monads
  class Maybe < Monad

    def bind(&block)
      if value.nil?
        self
      else
        block.call value
      end
    end



    def self.unit(value)
      new value
    end

  end
end
