class Number2English
  class Mapper
    def self.map(key)
      values = (key > 20) ? key.to_s.chars : [key]

      word_array = Number2English::Padder.pad(values)

      form_word(word_array).join(' ')
    end


    def self.form_word(values)
      hash = Number2English::Word.hash

      values.collect do |number|
        hash.fetch(number.to_i)
      end
    end
  end
end
