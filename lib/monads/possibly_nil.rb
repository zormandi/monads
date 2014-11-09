module Monads
  class PossiblyNil < Monad

    def self.wrap(value)
      if value.nil?
        DefinitelyNil.new
      else
        NotNil.new value
      end
    end



    class NotNil < PossiblyNil

      def or_else(_)
        value
      end



      def pass(&block)
        block.call value
      end

    end


    class DefinitelyNil < PossiblyNil

      def initialize
        super nil
      end



      def or_else(default_value)
        default_value
      end



      def pass(&block)
        self
      end

    end

  end
end



def possibly_nil(value)
  PossiblyNil.wrap value
end
