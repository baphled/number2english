class Number2English
  class OutOfRangeException < Exception
  end
end

class Number2English
  def self.parse number
    if number < 0
      raise Number2English::OutOfRangeException
    end
  end
end
