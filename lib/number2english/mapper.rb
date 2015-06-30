class Number2English
  class Mapper
    def self.map(key)
      values = (key > 20) ? key.to_s.chars : [key]

      numbers = Number2English::Padder.pad(values)
      word_array = sanitise_number(numbers)

      form_word(word_array).join(' ')
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
