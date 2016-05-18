# In class + hw exercise Guess Who Game 5/17/2016

# In terminal type game = Guesswho.new './suspects.csv'

require 'csv'


class Suspect
	attr_accessor :name, :gender, :skin_color, :hair_color, :eye_color
	def initialize name, gender, skin_color, hair_color, eye_color
		self.name = name
		self.gender = gender
		self.skin_color = skin_color
		self.hair_color = hair_color
		self.eye_color = eye_color
	end
end




#may want to have this as a separate file that does require './Suspect.rb'
class Guesswho

	attr_accessor :players, :suspects, :villian

	def initialize file
		self.suspects = Array.new   
		CSV.foreach(file) do |csv|
			self.suspects << Suspect.new(csv[0], csv[1], csv[2], csv[3], csv[4])
		end
	end


	def search_and_remove_by_gender gender
		if villian.gender != gender
			suspects.delete_if { |suspect| 
				suspect.gender == gender
			}
		end
	end

	def search_and_remove_by_skin_color skin_color
		if villian.skin_color != gender
			suspects.delete_if { |suspect| 
				suspect.skin_color == skin_color
			}
		end
	end

	def search_and_remove_by_hair_color hair_color
		if villian.hair_color != gender
			suspects.delete_if { |suspect| 
				suspect.hair_color == hair_color
			}
		end
	end

	def search_and_remove_by_eye_color eye_color
		if villian.eye_color != gender
			suspects.delete_if { |suspect| 
				suspect.eye_color == eye_color
			}
		end
	end
end
	# finish for other attributes