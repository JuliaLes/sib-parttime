

# League Point Calculator SI Homework 
# Julia Les 5/19/2016

# Prompt: Build a League Point Calculator. The LPC should be able to
# let the user input scores and output the league ranking based on points
# from highest to lowest. If there is a tie then they should be ordered 
# alphabetically. Each winning team gets 3 points and the osing team gets 
# 0 points. If the game ends in a tie both teams get 1 point. The output should 
# look something like this:
# Yankees 9
# Giants 4
# Mets 4
# Cardinals 0


def league_point_calculator

	league_hash = Hash.new

	while true

		puts "\nWhat is the name of the home team?"
		home_team_name = gets.chomp.capitalize


		while true 
			puts "\nWhat did #{home_team_name} score?"
			home_team_score = gets.chomp

			# make sure the score is an interger

			if home_team_score.to_i.to_s == home_team_score
				break
			else
				puts "Please enter an interger score value."
			end
		end



		puts "\nWhat is the name of the away team?"
		away_team_name = gets.chomp.capitalize

		while true 
			puts "\nWhat did #{away_team_name} score?"
			away_team_score = gets.chomp

			# make sure the score is an interger

			if away_team_score.to_i.to_s == away_team_score
				break
			else
				puts "Please enter an interger score value."
			end
		end

		home_team_league_points = 0
		away_team_league_points = 0


		#Compare game scores to detemine earned league points for that game

		if home_team_score > away_team_score
			home_team_league_points += 3
		elsif home_team_score < away_team_score
			away_team_league_points += 3
		else
			home_team_league_points += 1
			away_team_league_points += 1
		end

		puts "\nThe #{home_team_name} has #{home_team_league_points} league points from this game."
		puts "The #{away_team_name} has #{away_team_league_points} league points from this game.\n"

		
		# Add data from game to league hash

		if league_hash.has_key?("#{home_team_name}")
			league_hash["#{home_team_name}"] += home_team_league_points
		else 
			league_hash["#{home_team_name}"] = home_team_league_points
		end

		if league_hash.has_key?("#{away_team_name}")
			league_hash["#{away_team_name}"] += away_team_league_points
		else
			league_hash["#{away_team_name}"] = away_team_league_points
		end



		# Sorting the hash of league scores

		sorted_league_hash = league_hash.sort do |team,score|
			team.last == score.last ? team.first <=> score.first : score.last <=> team.last
		end

		# List the sorted league scores

		puts "\nThe current league scores are as follows:"
		sorted_league_hash.each { |team,score| puts "#{team} #{score}"}
		


		# Make decision to add data for additional games

		while true
			puts "\nIs there another game for which you would like to log data? (yes/no)"
			response = gets.chomp.downcase

			if response == 'yes'
				puts "\n~~Please enter data for the next game~~\n"
				break
			elsif response == 'no'
				exit
			else
				puts "please answer 'yes' or 'no'"
			end
		end

	end


end




