class Number2English
  class Thousands < Numbers
    def self.pre_parse(numbers)
      parsed_numbers = [numbers[0], '1000', numbers[1]]

      parsed_numbers = parsed_numbers.concat(['100']) if digit_above_hundred?(numbers[1])

      parsed_numbers
    end

    protected

    def self.digit_above_hundred?(number)
      (number.to_i > 0) ? true : false
    end

    private

    def self.last_numbers
      { second_to_last: 2, last: 3 }
    end
  end
end
