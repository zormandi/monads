require 'spec_helper'

module Monads
  describe Maybe do

    it_should_behave_like "a monad"


    it "should allow sending messages to the wrapped value if it isn't nil" do
      expect(Maybe.unit("test").length).to eq Maybe.unit(4)
    end


    it "should disregard messages if the wrapped value is nil" do
      expect(Maybe.unit(nil).length).to eq Maybe.unit(nil)
    end


    it "should be chainable to allow sending messages to nil objects in nested data structures" do
      weather_forecast = nil

      expect(Maybe.unit(weather_forecast).state.capitol.weather.value).to be_nil
    end

  end
end
