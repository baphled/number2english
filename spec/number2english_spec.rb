require "spec_helper"

describe Number2English do
  subject { described_class }

  it 'takes a number' do
    expect do
      subject.parse(1)
    end.not_to raise_error
  end

  it 'only takes a positive number' do
    expect{ subject.parse(-1) }.to raise_error Number2English::OutOfRangeException
  end

  it 'can handle 0' do
    expect(subject.parse(0)).to eql('zero')
  end

  (0..10).each do |number|
    it "can generate a word for #{number}" do
      expect do
        subject.parse(number)
      end.not_to raise_error
    end
  end

  context 'double digit numbers' do
    it 'can handle join double digit numbers' do
      expect(subject.parse(22)).to eql('twenty two')
    end

    [37, 84, 53, 12, 23, 48].each do |number|
      it "can generate a word for #{number}" do
        expect do
          subject.parse(number)
        end.not_to raise_error
      end
    end
  end
end
