# Write a program that prints out the complete lyrics to “99 bottles of beer on the wall.”

def bottles_of_beer

    puts "How many bottles of beer are on the wall?"
    num_of_bottles = gets.chomp.to_i

 	if num_of_bottles < 1 
 		puts "Please enter a valid number of bottles."
 		bottles_of_beer

 	end
    
    until num_of_bottles < 1
        
        puts "#{num_of_bottles} bottles of beer on the wall, #{num_of_bottles} bottles of beer... \nTake one down, pass it around, #{num_of_bottles -1} bottles of beer on the wall!"
    
        num_of_bottles -= 1
    end
	
end