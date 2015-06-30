class Number2English
  class OutOfRangeException < Exception
  end

  class Word
    def self.hash
      { 
        0 => 'zero',
        1 => 'one',
        2 => 'two',
        3 => 'three',
        4 => 'four',
        5 => 'five',
        6 => 'six',
        7 => 'seven',
        8 => 'eight',
        9 => 'nine',
        10 => 'ten',
        20 => 'twenty',
        30 => 'thirty',
        40 => 'fourty',
        50 => 'fifty',
        60 => 'sixty',
        70 => 'seventy',
        80 => 'eighty',
        90 => 'ninety',
        100 => 'hundred',
        1000 => 'thousand',
      }
    end
  end
end

class Number2English

  def self.parse number
    if number < 0
      raise Number2English::OutOfRangeException
    end

    word_hash(number)
  end

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
