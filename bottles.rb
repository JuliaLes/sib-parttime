
# Lyrics to "99 Bottles of Beer on the Wall" SI Homework
# Julia Les 4/29/15

# Prompt: Write a program that prints out the complete lyrics to 
# “99 Bottles of Beer on the Wall.”

def bottles_of_beer
    puts "\nHow many bottles of beer are on the wall?"
    num_of_bottles = gets.chomp.to_i
    start_num_of_bottles = num_of_bottles

 	if num_of_bottles < 1 
 		puts "Please enter a valid interger number of bottles."
 		bottles_of_beer
 	else
	    while num_of_bottles > 1
	        puts "#{num_of_bottles} bottles of beer on the wall, #{num_of_bottles} bottles of beer... \nTake one down, pass it around, #{num_of_bottles -1} bottles of beer on the wall!"
	        num_of_bottles -= 1
	    end
	    
	    puts "1 bottle of beer on the wall, 1 bottle of beer... \nTake one down and pass it around, no more bottles of beer on the wall!"
		puts "No more bottles of beer on the wall, no more bottles of beer... \nGo to the store and buy some more, #{start_num_of_bottles} bottles of beer on the wall!"
	end
end