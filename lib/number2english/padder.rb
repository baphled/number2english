class Number2English
  class Padder
    def self.pad(numbers)
      padded_numbers = parse_numbers(numbers)
      strip_added_zeroes(padded_numbers)
    end

    protected

    #
    # TODO We should still expose this to a public API
    #
    def self.parse_numbers(numbers, padded_numbers = [])
      case  numbers.size
      when 2
        numbers[0] = numbers[0] + '0'
        padded_numbers = numbers
      when 3
        padded_numbers = Hundreds.parse(numbers)
      when 4
        padded_numbers = Thousands.parse(numbers)
      else
        padded_numbers = numbers
      end
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
