$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'number2english/word'
require 'number2english/exceptions'

class Number2English

  def self.parse number
    raise Number2English::NonInteger unless number.is_a? Integer
    raise Number2English::OutOfRangeException if number < 0 or number > 9999

    word_hash(number)
  end

  protected

  def self.word_hash(key)
    hash = Word.hash
    numbers = key.to_s.chars
    numbers = pad_numbers(numbers)
    numbers = strip_trailing_zeroes(numbers) unless numbers.size == 1

    numbers.collect do |key|
      hash.fetch(key.to_i)
    end.join(' ')
  end

  private

  def self.pad_numbers(numbers)
    if numbers.count == 2
      numbers[0] = numbers[0] + '0'
    elsif numbers.count == 3
      numbers = [numbers[0], '100', (numbers[1] + '0') , numbers[2]]
    elsif numbers.count == 4
      numbers = [numbers[0], '1000', numbers[1], '100', (numbers[2] + '0'), numbers[3]]
    end
    numbers
  end

  def self.strip_trailing_zeroes(numbers)
    numbers = (numbers.last == '0')? numbers.slice(0, (numbers.size - 1)) : numbers
    numbers = (numbers.last == '00')? numbers.slice(0, (numbers.size - 1)) : numbers
  end
end
