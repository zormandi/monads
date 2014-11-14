require 'spec_helper'

module Monads
  describe List do

    it_should_behave_like "a monad"


    it "should handle nested arrays without overly flattening or nesting them" do
      expect(List.unit([[1, 2], [3, 4]]).bind { |value| List.unit value }).to eq List.unit([[1, 2], [3, 4]])
    end


    it "should send messages to all the values it contains" do
      headers = %w[HTTP_HOST HTTP_CONTENT_TYPE HTTP_DATE]

      expect(many(*headers)[5..-1].tr("_", "-").capitalize.values).to eq %w[Host Content-type Date]
    end


    describe "#+" do
      it "should concatenate two lists" do
        expect(List.unit(1, 2) + List.unit(3, 4)).to eq List.unit(1, 2, 3, 4)
      end
    end

  end
end
