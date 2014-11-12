module Monads
  class List < Monad

    alias_method :values, :value



    def bind(&block)
      self.class.new values.map(&block).flat_map(&:values)
    end



    def +(list)
      self.class.new values + list.values
    end



    def self.unit(*values)
      new values
    end

  end
end
