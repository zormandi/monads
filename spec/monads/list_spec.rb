require 'spec_helper'

module Monads
  describe List do

    it "should obey the 1st monad law" do
      array = [1, 2, 3]
      f = ->(value) { described_class.wrap "f#{value}" }

      direct_result = f.call(array)
      passed_result = described_class.wrap(array).pass { |value| f.call(value) }

      expect(direct_result).to eq passed_result
    end


    it "should obey the 2nd monad law" do
      monad = described_class.wrap [[1, 2], [3, 4]]

      expect(monad.pass { |value| described_class.wrap value }).to eq monad
    end


    it "should obey the 3rd monad law" do
      a = "a"
      monad = described_class.wrap a
      f = ->(value) { described_class.wrap "f#{value}" }
      g = ->(value) { described_class.wrap "g#{value}" }

      chained_result = monad.pass do |value|
        f.call value
      end.pass do |value|
        g.call value
      end

      nested_result = monad.pass do |v1|
        f.call(v1).pass do |v2|
          g.call v2
        end
      end

      expect(nested_result).to eq chained_result
    end


    describe "#+" do
      it "should concatenate two lists" do
        expect(List.new([1, 2]) + List.new([3, 4])).to eq List.new([1, 2, 3, 4])
      end
    end

  end
end
