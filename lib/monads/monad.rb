module Monads
  class Monad

    attr_reader :value



    def initialize(value)
      @value = value
    end



    def fmap(&block)
      pass { |value| self.class.wrap block.call value }
    end



    def method_missing(*args, &block)
      fmap { |value| value.public_send *args, &block }
    end



    def ==(other)
      (other.is_a? self.class) and (other.value == value)
    end

  end
end
