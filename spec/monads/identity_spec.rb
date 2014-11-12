require 'spec_helper'

module Monads
  describe Identity do

    it_should_behave_like "a monad"


    it "should proxy method calls to the wrapped value and return a monad corresponding to the result" do
      expect(Identity.unit("test value").length).to eq Identity.unit(10)
    end


    describe "#value" do
      it "should return the wrapped value" do
        expect(Identity.unit("test value").value).to eq "test value"
      end
    end

  end
end
