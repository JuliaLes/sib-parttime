#  Deaf Grandma program. 


def deaf_grandma  
    
    puts "What do you say to Grandma?"
    bye_count = 0
    
    while bye_count < 3
        
        you_say = gets.chomp
        
        if you_say == "BYE"
            puts "NO, NOT SINCE #{rand(1930..1980)}!"
            bye_count += 1
    
        elsif you_say == you_say.upcase
            puts "NO, NOT SINCE #{rand(1930..1980)}!"
            bye_count = 0 

        else  you_say != you_say.upcase
            puts "HUH?!, SPEAK UP SONNY!"
            bye_count = 0 

        end
    end
end
      