class Number2English
  class Hundreds < Numbers
    def self.parse(numbers)
      parsed_numbers = [numbers[0], '100']

      if last_values_above_twenty?(numbers[1], numbers[2])
        parsed_numbers = parsed_numbers.concat([(numbers[1] + '0'), numbers[2]])
      else
        parsed_numbers = parsed_numbers.concat([(numbers[1] + numbers[2])])
      end
      parsed_numbers
    end
  end
end
