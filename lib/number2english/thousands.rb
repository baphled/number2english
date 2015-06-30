class Number2English
  class Thousands < Numbers
    def self.parse(numbers)
      parsed_numbers = [numbers[0], '1000', numbers[1]]
      parsed_numbers = parsed_numbers.concat(['100']) if digit_above_hundred(numbers[1])

      if last_values_above_twenty?(numbers[2], numbers[3])
        parsed_numbers = parsed_numbers.concat([(numbers[2] + '0'), numbers[3]])
      else
        parsed_numbers = parsed_numbers.concat([(numbers[2] + numbers[3])])
      end
      parsed_numbers
    end
  end
end
