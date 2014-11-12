module Monads
  class Identity < Monad

    def bind(&block)
      block.call value
    end



    def self.unit(value)
      new value
    end

  end
end
