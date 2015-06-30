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
    it 'will not take a number larger than 9999' do
      expect{ subject.parse('10000') }.to raise_error Number2English::NonInteger
    end
  end
end
