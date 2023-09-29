require_relative 'spec_helper'

describe Monomial do
  describe '#*' do
    it do
      expect(described_class.new(1) * described_class.new(0))
        .to eq described_class.new(1)
    end

    it do
      expect(described_class.new(0) * described_class.new(1))
        .to eq described_class.new(1)
    end

    it do
      expect(described_class.new(1) * described_class.new(1))
        .to eq described_class.new(2)
    end
  end
end
