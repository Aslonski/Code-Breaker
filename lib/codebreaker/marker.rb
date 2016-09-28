	class Marker

		def initialize(secret, guess)
			@secret, @guess = secret, guess
		end

		def number_match_count
			total_match_count - exact_match_count
			# (0..3).inject(0) do |count, index|
			# 	count + (number_match?(index) ? 1 : 0)
			# end
		end

		def total_match_count
			# count = 0 
			# secret = @secret.split('')
			# @guess.split('').map do |n|
			# 	if secret.include?(n)
			# 		secret.delete_at(secret.index(n))
			# 		count += 1
			# 	end
			# end
			# count

			# refactored solution:
			secret = @secret.split('')
			@guess.split('').inject(0) do |count, n|
				count + (delete_first(secret, n) ? 1 : 0)
			end
		end

		def delete_first(code, n)
			code.delete_at(code.index(n)) if code.index(n)
		end


		def exact_match_count
			(0..3).inject(0) do |count, index|
				count + (exact_match?(index) ? 1 : 0)
			end
		end
		
		def exact_match?(index)
			@guess[index] == @secret[index]
		end

		def number_match?(index)
			@secret.include?(@guess[index]) && !exact_match?(index)
		end

	end
