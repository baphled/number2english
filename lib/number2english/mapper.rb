class Number2English
  class Mapper
    def self.map(key)
      values = (key > 20) ? key.to_s.chars : [key]

      numbers = pad_numbers(values)
      word_array = sanitise_number(numbers)

      form_word(word_array).join(' ')
    end

    protected

    # TODO: This is too complex and hard to test.
    #
    # This could be moved into a class that handles specifically with padding the
    # input numbers and returning them.
    #
    def self.pad_numbers(numbers)
      padded_numbers = []
      if numbers.count == 2
        numbers[0] = numbers[0] + '0'
        padded_numbers = numbers
      elsif numbers.count == 3
        if last_values_above_twenty?(numbers[1], numbers[2])
          padded_numbers = [numbers[0], '100', (numbers[1] + '0') , numbers[2]]
        else
          padded_numbers = [numbers[0], '100', numbers[1] + numbers[2]]
        end
      elsif numbers.count == 4
        if last_values_above_twenty?(numbers[2], numbers[3])
          if digit_above_hundred(numbers[1])
            padded_numbers = [numbers[0], '1000', numbers[1], '100', (numbers[2] + '0'), numbers[3]]
          else
            padded_numbers = [numbers[0], '1000', numbers[1], (numbers[2] + '0'), numbers[3]]
          end
        else
          if digit_above_hundred(numbers[1])
            padded_numbers = [numbers[0], '1000', numbers[1], '100', (numbers[2] + numbers[3])]
          else
            padded_numbers = [numbers[0], '1000', numbers[1], (numbers[2] + numbers[3])]
          end
        end
      else
        padded_numbers = numbers
      end
    end

    def self.digit_above_hundred(number)
      (number.to_i > 0) ? true : false
    end

    def self.last_values_above_twenty?(second_to_last_number, last_numbers)
      (second_to_last_number + last_numbers).to_i > 20 ? true : false
    end

    private

    def self.sanitise_number(numbers)
      non_zero_numbers = numbers.select { |v| v.to_i > 0 }
      non_zero_numbers.empty? ? [0] : non_zero_numbers
    end

    def self.form_word(values)
      hash = Number2English::Word.hash

      values.collect do |number|
        hash.fetch(number.to_i)
      end
    end
  end
end
