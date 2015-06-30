require 'spec_helper'

class Number2English
  describe Padder do
    subject { described_class }

    it 'returns an array with one integer' do
      numbers = ['0']
      expect(subject.pad(numbers)).to eql(['0'])
    end

    it 'takes numbers under 20 as a single integer' do
      numbers = ['19']
      expect(subject.pad(numbers)).to eql(['19'])
    end

    context 'a double digit number' do
      let(:numbers) { ['2', '9'] }

      it 'returns an array with 2 integers' do
        expect(subject.pad(numbers)).to eql(['20', '9'])
      end
    end

    context 'a tripe digit numbers' do
      let(:numbers) { ['1', '7', '9'] }

      it 'returns an array with 4 integers' do
        expect(subject.pad(numbers)).to eql(['1', '100', '70', '9'])
      end
    end

    context 'a tripe digit numbers with a low number' do
      let(:numbers) { ['1', '0', '0'] }

      it 'returns an array with 2 integers' do
        expect(subject.pad(numbers)).to eql(['1', '100'])
      end
    end
  end
end
