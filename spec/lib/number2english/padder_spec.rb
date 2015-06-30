require 'spec_helper'

class Number2English
  describe Padder do
    subject { described_class }

    it 'returns an array with one integer' do
      numbers = ['1']
      expect(subject.pad(numbers)).to eql(['1'])
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
      let(:numbers) { ['1', '0', '9'] }

      it 'returns an array with 4 integers' do
        expect(subject.pad(numbers)).to eql(['1', '100', '09'])
      end

    end
    context 'a triple digit numbers' do
      let(:numbers) { ['1', '2', '9'] }

      it 'returns an array with 4 integers' do
        expect(subject.pad(numbers)).to eql(['1', '100', '20', '9'])
      end
    end
    context 'a quadruple digit numbers' do
      let(:numbers) { ['1', '9', '7', '9'] }

      it 'returns an array with 6 integers' do
        expect(subject.pad(numbers)).to eql(['1', '1000', '9', '100', '70', '9'])
      end
    end

    context 'a quadruple digit numbers with a low number' do
      let(:numbers) { ['1', '9', '1', '9'] }

      it 'returns an array with 6 integers' do
        expect(subject.pad(numbers)).to eql(['1', '1000', '9', '100', '19'])
      end
    end
  end
end
