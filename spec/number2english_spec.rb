require "spec_helper"

describe Number2English do
  subject { described_class }

  it 'takes a number' do
    expect do
      subject.parse(1)
    end.not_to raise_error
  end

  context 'input range' do
    it 'only takes a positive number' do
      expect{ subject.parse(-1) }.to raise_error Number2English::OutOfRangeException
    end

    it 'will not take a number larger than 9999' do
      expect{ subject.parse(10000) }.to raise_error Number2English::OutOfRangeException
    end

  end

  context 'non integer types' do
    it 'will not take a number larger than 9999' do
      expect{ subject.parse('10000') }.to raise_error Number2English::NonInteger
    end
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

    {
      37 => 'thirty seven',
      84 => 'eighty four',
      53 => 'fifty three',
      12 => 'twelve',
      19 => 'nineteen',
      23 => 'twenty three',
      48 => 'forty eight'
    }.each_pair do |number, expected|
      it "can generate a word for #{number}" do
        expect(subject.parse(number)).to eql(expected)
      end
    end

    it 'can handle numbers below 20' do
      expect(subject.parse(12)).to eql('twelve')
    end
  end

  context 'triple digit numbers' do
    it 'can handle mapping triple digit number' do
      expect(subject.parse(323)).to eql('three hundred twenty three')
    end

    it 'can handle stripping our extra zeroes' do
      expect(subject.parse(420)).to eql('four hundred twenty')
    end

    it 'can handle stripping our extra zeroes' do
      expect(subject.parse(400)).to eql('four hundred')
    end

    {
      379 => 'three hundred seventy nine',
      894 => 'eight hundred ninety four',
      819 => 'eight hundred nineteen',
      653 => 'six hundred fifty three',
      192 => 'one hundred ninety two',
      293 => 'two hundred ninety three',
      438 => 'four hundred thirty eight'
    }.each_pair do |number, expected|
      it "can generate a word for #{number}" do
        expect(subject.parse(number)).to eql(expected)
      end
    end

    it 'can handle numbers with zeroes after the first digit' do
      expect(subject.parse(202)).to eql('two hundred two')
    end

    it 'can handle 213' do
      expect(subject.parse(213)).to eql('two hundred thirteen')
    end
  end

  context 'quadruple digit numbers' do
    it 'can handle mapping quadruple digit number' do
      expect(subject.parse(4325)).to eql('four thousand three hundred twenty five')
    end

    it 'can handle stripping our extra zeroes' do
      expect(subject.parse(4320)).to eql('four thousand three hundred twenty')
    end

    it 'can round off properly' do
      expect(subject.parse(4300)).to eql('four thousand three hundred')
    end

    it 'can handle numbers with zeroes after the first digit' do
      expect(subject.parse(2020)).to eql('two thousand twenty')
    end

    {
      2379 => 'two thousand three hundred seventy nine',
      8894 => 'eight thousand eight hundred ninety four',
      1239 => 'one thousand two hundred thirty nine',
      2312 => 'two thousand three hundred twelve',
      7634 => 'seven thousand six hundred thirty four',
      8919 => 'eight thousand nine hundred nineteen',
      9120 => 'nine thousand one hundred twenty',
    }.each_pair do |number, expected|
      it "can generate a word for #{number}" do
        expect(subject.parse(number)).to eql(expected)
      end
    end

  end
end
