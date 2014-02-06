require 'spec_helper'

describe Sperm::RandomPermutations do
  subject { Sperm::RandomPermutations.new(order) }

  describe '#rand' do
    context 'when order is zero' do
      let(:order) { 0 }
      it 'generates an empty permutation' do
        expect(subject.rand).to be_empty
      end
    end

    context 'when order is small' do
      let(:order) { 42 }
      it 'generates a permutation' do
        expect(subject.rand).to be_a_permutation
      end
    end

    context 'when order is large' do
      let(:order) { 10**8 }
      it 'generates at least first element of permutation' do
        expect(subject.rand.first).to be_between(0, order - 1)
      end
    end

    context 'when order is too large' do
      let(:order) { 10**100 }
      it 'raises an error' do
        expect { subject }.to raise_error Sperm::NoSuitableGroup
      end
    end
  end
end
