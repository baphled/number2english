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
    values = (key > 20) ? key.to_s.chars : [key]
    numbers = pad_numbers(values)
    stripped_values = (numbers.size == 1) ? numbers : strip_trailing_zeroes(numbers)

    map_values(stripped_values).join(' ')
  end

  private

  def self.map_values(values)
    hash = Word.hash

    values.collect do |number|
      hash.fetch(number.to_i)
    end
  end

  def self.pad_numbers(numbers)
    padded_numbers = []
    if numbers.count == 2
      numbers[0] = numbers[0] + '0'
      padded_numbers = numbers
    elsif numbers.count == 3
      padded_numbers = [numbers[0], '100', (numbers[1] + '0') , numbers[2]]
    elsif numbers.count == 4
      if numbers[1].to_i > 0
        padded_numbers = [numbers[0], '1000', numbers[1], '100', (numbers[2] + '0'), numbers[3]]
      else
        padded_numbers = [numbers[0], '1000', numbers[1], (numbers[2] + '0'), numbers[3]]
      end
    else
      padded_numbers = numbers
    end

    non_zero_numbers = padded_numbers.select { |v| v.to_i > 0 }
    non_zero_numbers.empty? ? [0] : non_zero_numbers
  end

  def self.strip_trailing_zeroes(numbers)
    numbers = (numbers.last == '0')? numbers.slice(0, (numbers.size - 1)) : numbers
    numbers = (numbers.last == '00')? numbers.slice(0, (numbers.size - 1)) : numbers
  end
end
