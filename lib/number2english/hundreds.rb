class Number2English
  class Hundreds < Numbers

    def self.pre_parse(numbers)
      [numbers[0], '100']
    end
    
    private

    def self.last_numbers
      { second_to_last: 1, last: 2 }
    end
  end
end
