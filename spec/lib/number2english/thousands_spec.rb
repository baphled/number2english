require 'spec_helper'
class Number2English
  describe Thousands do
    subject { described_class }

    describe '#parse' do
      it 'returns an array with 6 integers' do
        numbers = ['1', '9', '7', '9']
        expect(subject.parse(numbers)).to eql(['1', '1000', '9', '100', '70', '9'])
      end

      it 'returns an array with 6 integers' do
        numbers = ['1', '9', '1', '9']
        expect(subject.parse(numbers)).to eql(['1', '1000', '9', '100', '19'])
      end
    end
  end
end
