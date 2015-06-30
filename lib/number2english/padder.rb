class Number2English
  class Padder
    def self.pad(numbers)
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
  end
end