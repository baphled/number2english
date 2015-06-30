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
    if numbers.count == 2
      numbers[0] = numbers[0] + '0'
      numbers.collect do |key|
        hash.fetch(key.to_i)
      end.join(' ')
    else
      hash.fetch(key)
    end
  end
end
