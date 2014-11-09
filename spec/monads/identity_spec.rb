require 'spec_helper'

describe Monads::Identity do

  it "should obey the 1st monad law" do
    described_class.wrap("wrapped value").pass { |value| expect(value).to eq "wrapped value" }
  end

  it "should obey the 2nd monad law" do
    monad = described_class.wrap "wrapped value"

    expect(monad.pass { |value| described_class.wrap value }).to eq monad
  end

  it "should obey the 3rd monad law" do
    monad = described_class.wrap "some value"
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

end
