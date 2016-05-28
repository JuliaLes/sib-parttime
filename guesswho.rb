

# In-Class + Homework Exercise Guess Who Game SI 
# Julia Les 5/17/2016 (In-Progress)

# Create a "Guess Who" game.
# Your goal is to correctly identify the guilty suspect. 
# You should have multiple classes. You have 3 chances. 
# It should show a list of the suspects and the user is
# prompted to choose an attribute of hair color, eye color, 
# skin color, or gender. 
# If guilty suspect doesn’t match the trait entered
# then remove the suspects of that trait.

# Utilizes information contained in suspects.csv

# TODO: complete the program

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
			self.villain = self.suspects.sample(1)
			name_guess_count = 0
		end
	end

	def guess_name(name)
		if villain.name != name
			suspects.delete_if { |suspect|
				suspect.name == name 
			}
			puts "That is not the villain's name"
			name_guess_count += 1
			self.end_turn
		else
			suspects.delete_if { |suspect| 
				suspect.name != name 
			}
			puts "You have correctly guessed the villain's name!"
			puts "The villain is #{self.suspects}! You win! "
			exit
		end
	end

	def guess_gender(gender)
		if villain.gender != gender
			suspects.delete_if { |suspect| 
				suspect.gender == gender
			}
			puts "That is not the villain's gender."
		else 
			suspects.delete_if { |suspect| 
				suspect.gender != gender
			}
			puts "That is the villain's gender."
		end
		self.end_turn
	end

	def guess_skin_color(skin_color)
		if villian.skin_color != skin_color
			suspects.delete_if { |suspect| 
				suspect.skin_color == skin_color
			}
			puts "That is not the villain's skin color."
		else
			suspects.delete_if { |suspect| 
				suspect.skin_color != skin_color
			}
			puts "That is the villain's skin color."
		end
		self.end_turn
	end

	def guess_hair_color(hair_color)
		if villian.hair_color != hair_color
			suspects.delete_if { |suspect| 
				suspect.hair_color == hair_color
			}
			puts "That is not the villain's hair color."
		end
			suspects.delete_if { |suspect| 
				suspect.hair_color != hair_color
			}
			puts "That is the villain's hair color."
		end
		self.end_turn
	end

	def guess_eye_color(eye_color)
		if villain.eye_color != eye_color
			suspects.delete_if { |suspect| 
				suspect.eye_color == eye_color
			}
			puts "That is not the villain's eye color."
		else
			suspects.delete_if { |suspect| 
				suspect.eye_color != eye_color
			}
			puts "That is the villain's eye color."
		end
		self.end_turn
	end

	def end_turn
		if self.suspects.count == 1
			puts "Congrats, you have isolated the villain #{self.suspects}."
		elsif name_guess_count == 3 && self.suspects.count > 1
			puts "You have made the maximum number of name guesses and"
			puts "failed to isolate the villain. You lose!"
			exit
		else
			puts "The remainig suspects are #{self.suspects}."
		end
	end

	def start_turn
			puts "Would you like to make another guess about the villain's features"
			puts "such as gender, hair, skin, or eye color?"
			puts "Or would you like to name the villain?"
			puts "(Please type 'gender' 'hair' 'skin' 'eye' or 'name' to proceed.)"  
			guess_type = gets.chomp.downcase!
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
					puts "That is not a valid entry.\n"
					self.start_turn
				end
			end
		end
	end
end

def turn_sequence
	player1_game = GuessWho.new
	player2_game = GuessWho.new

	loop do
		player1_game.start_turn
		player2_game.start_turn
	end
end
