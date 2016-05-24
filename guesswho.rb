

# In-Class + Homework Exercise Guess Who Game SI 
# Julia Les 5/17/2016

# Create a "Guess Who" game.
# Your goal is to correctly identify the guilty suspect. 
# You should have multiple classes. You have 3 chances. 
# It should show a list of the suspects and the user is
# prompted to choose an attribute of hair color, eye color, 
# skin color, or gender. 
# If guilty suspect doesn’t match the trait entered
# then remove the suspects of that trait.

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

class Guesswho
	attr_accessor :players, :suspects, :villain

	def initialize(file)
		self.suspects = Array.new   
		CSV.foreach(file) do |csv|
			self.suspects << Suspect.new(csv[0], csv[1], csv[2], csv[3], csv[4])
			self.villain = self.suspects.sample(1)
		@guess_count = 0
		end
	end

	def guess_gender(gender)
		if villain.gender != gender
			suspects.delete_if { |suspect| 
				suspect.gender == gender
			}
		else 
			suspects.delete_if { |suspect| 
				suspect.gender != gender
			}
		end
		@guess_count += 1
		puts "The remainig suspects are #{self.suspects}."
		final_eval 
	end

	def guess_skin_color(skin_color)
		if villian.skin_color != skin_color
			suspects.delete_if { |suspect| 
				suspect.skin_color == skin_color
			}
		else
			suspects.delete_if { |suspect| 
				suspect.skin_color != skin_color
			}
		end
		@guess_count += 1
		puts "The remainig suspects are #{self.suspects}."
		final_eval
	end

	def guess_hair_color(hair_color)
		if villian.hair_color != hair_color
			suspects.delete_if { |suspect| 
				suspect.hair_color == hair_color
			}
		end
			suspects.delete_if { |suspect| 
				suspect.hair_color != hair_color
			}
		end
		@guess_count += 1
		puts "The remainig suspects are #{self.suspects}."
		final_eval
	end

	def guess_eye_color(eye_color)
		if villian.eye_color != eye_color
			suspects.delete_if { |suspect| 
				suspect.eye_color == eye_color
			}
		else
			suspects.delete_if { |suspect| 
				suspect.eye_color != eye_color
			}
		end
		@guess_count += 1
		puts "The remainig suspects are #{self.suspects}."
		final_eval
	end

	def final_eval
		if guess_count== 3
			if self.suspects.count == 1
				puts "Congrats, you have identified the villain as #{self.suspects}."
			else
				puts "You have failed to isolate the villain.\nThe villain was #{self.villain}"
			end
		end
	end