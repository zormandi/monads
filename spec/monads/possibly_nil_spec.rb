require 'spec_helper'

module Monads
  describe PossiblyNil do

    describe ".wrap" do
      it "should create an instance of the monad" do
        expect(described_class.wrap 1).to be_a described_class
      end
    end


    describe "#value" do
      it "should return the decorated value" do
        expect(described_class.wrap(1).value).to eq 1
      end
    end


    describe "composition" do
      it "should return a PossiblyNil with nil if one of the arguments is nil" do
        expect(PossiblyNil.wrap(nil)[:state][:capitol][:weather].value).to be_nil
      end

      it "should obey the 1st monad law" do
        add_one = ->(value) { PossiblyNil.wrap(value + 1) }

        passed_result = PossiblyNil.wrap(1).pass do |value|
          add_one.call(value)
        end

        expect(add_one.call(1)).to eq passed_result
      end

      it "should obey the 3rd monad law" do
        f = Proc.new { |x| PossiblyNil.wrap(x*2) }
        g = Proc.new { |x| PossiblyNil.wrap(x+1) }
        m = PossiblyNil.wrap(3)
        expect(m.pass { |x| f[x] }.pass { |x| g[x] }.value).to eq m.pass { |x| f[x].pass { |y| g[y] } }.value
      end
    end


    describe "#or_else" do
      it "should return the monad's value if it's not nil" do
        expect(PossiblyNil.wrap(1).or_else(2)).to eq 1
      end

      it "should return the default value if the monad's value is nil" do
        expect(PossiblyNil.wrap(nil).or_else(2)).to eq 2
      end
    end
  end
end
