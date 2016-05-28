
# In-Class + Homework Exercise Guess Who Game SI 
# Julia Les 5/17/2016 (In-Progress)

# Create a "Guess Who" game.
# Your goal is to correctly identify the guilty suspect. 
# You should have multiple classes.  
# It should show a list of the suspects and the user is
# prompted to choose an attribute of hair color, eye color, 
# skin color, or gender. If guilty suspect doesn’t match 
# the trait entered then remove the suspects of that trait.
# The number of name guesses cannot exceed 3 per player.
# Should be playable by two players from the terminal.

# Utilizes information contained in suspects.csv

require 'csv'

class Suspect
	attr_accessor :name, :gender, :skin_color, :hair_color, :eye_color

	def initialize(name, gender, skin_color, hair_color, eye_color)
		self.name = name
		self.gender = gender
		self.skin_color = skin_color
		self.hair_color = hair_color
		self.eye_color = eye_color
	end
end

class GuessWho
	attr_accessor :players, :suspects, :villain

	def initialize(file)
		self.suspects = Array.new   
		CSV.foreach(file) do |csv|
			self.suspects << Suspect.new(csv[0], csv[1], csv[2], csv[3], csv[4])
			self.villain = self.suspects[rand(0..self.suspects.length)]
			@name_guess_count = 0
		end
	end

	def guess_name
		puts "\nWhich name do you guess?\n"
		name = gets.chomp.downcase

		if self.villain.name != name
			self.suspects.delete_if { |suspect|
				suspect.name == name 
			}
			puts "\nThat is not the villain's name.\n"
			@name_guess_count += 1
			self.end_turn
		else
			self.suspects.delete_if { |suspect| 
				suspect.name != name 
			}
			puts "\nYou have correctly guessed the villain. You win!\n"
			exit
		end
	end

	def guess_gender
		puts "\nIs the suspect a boy or a girl?\n"
		gender = gets.chomp.downcase

		if self.villain.gender != gender
			self.suspects.delete_if { |suspect| 
				suspect.gender == gender
			}
			puts "\nThat is not the villain's gender.\n"
		else 
			self.suspects.delete_if { |suspect| 
				suspect.gender != gender
			}
			puts "\nThat is the villain's gender.\n"
		end
		self.end_turn
	end

	def guess_skin_color
		puts "\nWhich skin color do you guess?\n"
		skin_color = gets.chomp.downcase

		if self.villain.skin_color != skin_color
			self.suspects.delete_if { |suspect| 
				suspect.skin_color == skin_color
			}
			puts "\nThat is not the villain's skin color.\n"
		else
			self.suspects.delete_if { |suspect| 
				suspect.skin_color != skin_color
			}
			puts "\nThat is the villain's skin color.\n"
		end
		self.end_turn
	end

	def guess_hair_color
		puts "\nWhich hair color do you guess?\n"
		hair_color = gets.chomp.downcase

		if self.villain.hair_color != hair_color
			self.suspects.delete_if { |suspect| 
				suspect.hair_color == hair_color
			}
			puts "\nThat is not the villain's hair color.\n"
		else
			self.suspects.delete_if { |suspect| 
				suspect.hair_color != hair_color
			}
			puts "\nThat is the villain's hair color.\n"
		end
		self.end_turn
	end

	def guess_eye_color
		puts "\nWhich eye color do you guess?\n"
		eye_color = gets.chomp.downcase

		if self.villain.eye_color != eye_color
			self.suspects.delete_if { |suspect| 
				suspect.eye_color == eye_color
			}
			puts "\nThat is not the villain's eye color.\n"
		else
			self.suspects.delete_if { |suspect| 
				suspect.eye_color != eye_color
			}
			puts "\nThat is the villain's eye color.\n"
		end
		self.end_turn
	end

	def end_turn
		if @name_guess_count == 3 && self.suspects.count > 1
			puts "\nYou have made the maximum number of name guesses and"
			puts "failed to isolate the villain. You lose!\n"
			exit
		else
			puts " #{self.suspects.count} suspects remain."
			
		end
	end

	def start_turn
		puts "\nThe remainig suspects are:\n"
		self.suspects.each { |suspect| puts "name: #{suspect.name.ljust(8,' ')} gender: #{suspect.gender.ljust(5,' ')} hair: #{suspect.hair_color.ljust(7,' ')} eyes: #{suspect.eye_color.ljust(6,' ')} skin: #{suspect.skin_color.ljust(5,' ')}\n" }
		
		puts "\nWould you like to make a guess about the villain's features"
		puts "such as gender, hair, skin, or eye color?"
		puts "Or would you like to name the villain?"
		puts "(Please type 'gender' 'hair' 'skin' 'eye' or 'name' to proceed.)"  
		guess_type = gets.chomp.downcase

		if guess_type == "gender"
			self.guess_gender
		elsif guess_type == "hair"
			self.guess_hair_color
		elsif guess_type == "eye"
			self.guess_eye_color
		elsif guess_type == "skin"
			self.guess_skin_color
		elsif guess_type == "name"
			self.guess_name
		else
			puts "\nThat is not a valid entry.\n"
			self.start_turn
		end
	end			
end

def turn_sequence
	puts "\nWelcome to Guess Who!\n"
	player1_game = GuessWho.new('./suspects.csv')
	player2_game = GuessWho.new('./suspects.csv')

	loop do
		puts "\nNow it is Player 1's turn.\n"
		player1_game.start_turn
		puts "\nNow it is Player 2's turn.\n"
		player2_game.start_turn
	end
end

turn_sequence