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

  it 'can handle 0'
end
