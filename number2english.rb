class Number2English
	class OutOfRangeException < Exception
	end

	class Word
		def self.hash
			{ 
				0 => 'zero',
				1 => 'one'
			}
		end
	end
end

class Number2English

	def self.parse number
		if number < 0
			raise Number2English::OutOfRangeException
		end

		word_hash(number)
	end

	def self.word_hash(key)
		hash = Word.hash
		hash.fetch(key)
	end
end
