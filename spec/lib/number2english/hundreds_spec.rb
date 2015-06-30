require 'spec_helper'

class Number2English
  describe Hundreds do
    subject { described_class }

    describe '#parse' do
      it 'returns an array with 2 integers' do
        pending 'yet to get working'

        numbers = ['1', '0', '0']
        expect(subject.parse(numbers)).to eql(['1', '100'])
      end

      it 'returns an array with 3 integers' do
        numbers = ['1', '1', '9']
        expect(subject.parse(numbers)).to eql(['1', '100', '19' ])
      end

      it 'does not return extra zeroes' do
        numbers = ['4', '2', '0']
        expect(subject.parse(numbers)).to eql(['4', '100', '20' ])
      end

      it 'returns an array with 4 integers' do
        numbers = ['1', '9', '9']
        expect(subject.parse(numbers)).to eql(['1', '100', '90', '9'])
      end
    end
  end
end
