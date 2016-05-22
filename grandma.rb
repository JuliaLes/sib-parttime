

# Deaf Grandma Program SI Homework 
# Julia Les 5/03/16

# Prompt: Write a Deaf Grandma program. Whatever you say to grandma
# (user input) she should respond with HUH?!, SPEAK UP SONNY!, 
# unless you shout it (type in all CAPS). If you shout, she can hear
# you and yells back NO, NOT SINCE 1938! Grandma should shout a different 
# year each time; random between 1930 to 1980. You can’t stop talking to 
# grandma until you shout BYE.

# Add on to the above. Grandma really loves your company and doesn’t want
# you to go unless you shout BYE three times in a row. So if you say BYE 
# twice and then something else you have to say BYE three times again.



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

        else 
            puts "HUH?!, SPEAK UP SONNY!"
            bye_count = 0 

        end
    end
end
      