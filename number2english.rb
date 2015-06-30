$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'number2english/numbers'
require 'number2english/hundreds'
require 'number2english/thousands'

require 'number2english/word'
require 'number2english/mapper'

require 'number2english/padder'
require 'number2english/exceptions'

class Number2English

  def self.parse number
    raise Number2English::NonInteger unless number.is_a? Integer
    raise Number2English::OutOfRangeException if number < 0 or number > 9999

    Number2English::Mapper.map(number)
  end
end
