require 'spec_helper'

module Monads
  describe List do

    it_should_behave_like "a monad"


    it "should handle nested arrays without overly flattening or nesting them" do
      expect(List.unit([[1, 2], [3, 4]]).bind { |value| List.unit value }).to eq List.unit([[1, 2], [3, 4]])
    end


    it "should send messages to all the values it contains" do
      words = ["one", "two", "and three"]

      expect(many(*words).tr("o", "a").length.values).to eq [3, 3, 9]
    end


    describe "#+" do
      it "should concatenate two lists" do
        expect(List.new([1, 2]) + List.new([3, 4])).to eq List.new([1, 2, 3, 4])
      end
    end

  end
end
