require_relative '../spec_helper'

module Algebra
  describe Polynomial do
    let :x do
      described_class.new(Monomial.new(1))
    end

    describe '#hash' do
      it do
        expect(1.hash).not_to eq x.hash
      end

      it do
        expect((2 * x).hash).not_to eq x.hash
      end

      it do
        expect((x**2).hash).not_to eq x.hash
      end
    end

    describe '#==' do
      it do
        expect(x**1).to eq x
      end

      it do
        expect(x**2).not_to eq x
      end

      it do
        expect(x**0).to eq 1
      end
    end

    describe '#*' do
      it do
        expect(x * (x + 1)).to eq (x**2) + x
      end
    end

    describe '#**' do
      it do
        expect((x + 1)**2).to eq (x**2) + (2 * x) + 1
      end
    end
  end
end
