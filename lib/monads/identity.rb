module Monads
  class Identity < Monad

    def pass
      yield value
    end



    def self.wrap(value)
      new value
    end

  end
end
