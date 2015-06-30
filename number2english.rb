$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'number2english/word'
require 'number2english/exceptions'

class Number2English

  def self.parse number
    raise Number2English::NonInteger unless number.is_a? Integer
    raise Number2English::OutOfRangeException if number < 0 or number > 9999

    word_hash(number)
  end

  # NOTE: Implementing methods that are private or protected suggest that the functionality doesn't belong here.
  #
  # We could move the below methods out but for the time being it feels premature.
  #
  # Having said that for improved testability and with a better understanding
  # of how the padding algorithm would work that would be the first candidate

  protected

  def self.word_hash(key)
    values = (key > 20) ? key.to_s.chars : [key]

    numbers = pad_values(values)

    word_array = filter_values(numbers)

    map_values(word_array).join(' ')
  end

  private

  def self.filter_values(numbers)
    non_zero_numbers = numbers.select { |v| v.to_i > 0 }
    non_zero_numbers.empty? ? [0] : non_zero_numbers
  end

  def self.map_values(values)
    hash = Word.hash

    values.collect do |number|
      hash.fetch(number.to_i)
    end
  end

  # TODO: This is too complex and hard to test.
  #
  # This could be moved into a class that handles specifically with padding the
  # input numbers and returning them.
  #
  def self.pad_values(numbers)
    padded_numbers = []
    if numbers.count == 2
      numbers[0] = numbers[0] + '0'
      padded_numbers = numbers
    elsif numbers.count == 3
      if below_twenty?(numbers[1], numbers[2])
        padded_numbers = [numbers[0], '100', (numbers[1] + '0') , numbers[2]]
      else
        padded_numbers = [numbers[0], '100', numbers[1] + numbers[2]]
      end
    elsif numbers.count == 4
      if below_twenty?(numbers[2], numbers[3])
        if numbers[1].to_i > 0
          padded_numbers = [numbers[0], '1000', numbers[1], '100', (numbers[2] + '0'), numbers[3]]
        else
          padded_numbers = [numbers[0], '1000', numbers[1], (numbers[2] + '0'), numbers[3]]
        end
      else
        if numbers[1].to_i > 0
          padded_numbers = [numbers[0], '1000', numbers[1], '100', (numbers[2] + numbers[3])]
        else
          padded_numbers = [numbers[0], '1000', numbers[1], (numbers[2] + numbers[3])]
        end
      end
    else
      padded_numbers = numbers
    end
  end

  def self.below_twenty?(second_to_last_number, last_numbers)
    (second_to_last_number + last_numbers).to_i > 20 ? true : false
  end
end
