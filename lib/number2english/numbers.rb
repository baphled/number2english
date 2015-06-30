class Number2English
  class Numbers

    protected

    def self.digit_above_hundred(number)
      (number.to_i > 0) ? true : false
    end

    def self.last_values_above_twenty?(second_to_last_number, last_numbers)
      (second_to_last_number + last_numbers).to_i > 20 ? true : false
    end
  end
end
