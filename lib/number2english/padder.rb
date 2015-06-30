class Number2English
  class Padder
    def self.pad(numbers)
      padded_numbers = parse_numbers(numbers)
      strip_added_zeroes(padded_numbers)
    end

    protected

    # NOTE: We are still hdiing complexity and not testing the meat of
    # the functionality directory but we're getting a better
    # understanding of the functionality and it's getting easier to
    # reason about what is going on.
    #
    def self.parse_numbers(numbers, padded_numbers = [])
      case  numbers.size
      when  2
        numbers[0] = numbers[0] + '0'
        padded_numbers = numbers
      when 3
        if last_values_above_twenty?(numbers[1], numbers[2])
          padded_numbers = [numbers[0], '100', (numbers[1] + '0') , numbers[2]]
        else
          padded_numbers = [numbers[0], '100', numbers[1] + numbers[2]]
        end
      when 4
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

    # NOTE: It feels as though this is only here as the padder functionality is not fully understood yet
    #
    # Once we have an array of numbers we strip out any 0's we find
    #
    def self.strip_added_zeroes(numbers)
      non_zero_numbers = numbers.select { |v| v.to_i > 0 }
      non_zero_numbers.empty? ? ['0'] : non_zero_numbers
    end
  end
end
