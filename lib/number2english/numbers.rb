class Number2English
  class Numbers

    def self.parse(numbers)
      parsed_numbers = pre_parse(numbers)

      if last_values_above_twenty?(numbers[last_numbers[:second_to_last]], numbers[last_numbers[:last]])
        parsed_numbers = parsed_numbers.concat([(numbers[last_numbers[:second_to_last]] + '0'), numbers[last_numbers[:last]]])
      else
        parsed_numbers = parsed_numbers.concat([(numbers[last_numbers[:second_to_last]] + numbers[last_numbers[:last]])])
      end
      parsed_numbers
    end

    protected

    def self.last_values_above_twenty?(second_to_last_number, last_numbers)
      (second_to_last_number + last_numbers).to_i > 20 ? true : false
    end
  end
end
