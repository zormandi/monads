module Monads
  class List

    attr_reader :values



    def initialize(values)
      @values = values
    end



    def pass(&block)
      self.class.new @values.map(&block).flat_map(&:values)
    end



    def +(list)
      self.class.new @values + list.values
    end



    def ==(other)
      (other.is_a? self.class) and (other.values == values)
    end



    def self.wrap(value)
      new [value]
    end

  end
end
