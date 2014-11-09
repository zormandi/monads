module Monads
  class PossiblyNil < Monad

    def pass(&block)
      if value.nil?
        self
      else
        block.call value
      end
    end



    def self.wrap(value)
      new value
    end

  end
end



def possibly_nil(value)
  PossiblyNil.wrap value
end
