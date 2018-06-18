require 'rubygems'
require 'colorize'
def main
	x = Random.rand(1..50)
	guess_number(x)
end

def guess_number(x)
	history = []
	i = 0
	while i < 5
		print "ROUND #{i+1} input number : "
		guess = gets.chomp

		if guess == "secret"
			puts "secret number is #{x}".green
			next
		elsif guess == "hint"
			hint(x)
			next
		elsif guess.to_i > 0
			if history.include?(guess)
				puts "duplicate pls input difference number".red
				next
			else
				history.push(guess)
			end

			if suggest(guess,x) == true
				break
			end
		else
			puts "invalid number".red
			next
		end		
		i = i + 1	
	end
	puts "History : ".yellow
	puts history
	puts "Secret number is #{x}"

end

def suggest(guess,x)
	if guess.to_i < x
		puts "more than #{guess}"
		return false
	elsif guess.to_i > x
		puts "less than #{guess}"
		return false
	else
		puts "yes correct numer #{x}".green
		return true
	end
end

def hint(x)
	hint = rand(2..6)
	min = x - hint
	max = x + hint
	if min < 0
		min = 0
	end
	if max > x
		max = x
	end
	puts "HINT RANGE #{min} - #{max}".blue
end

main 