
# Cost of Gold SI Homework Assignment
# Juulia Les 4/19/16


# Prompt:
# If we assume the cost of gold is $1,336 per ounce, 
# what does the definition of price_of_gold look like?
# Write a function called ‘price_of_gold_from_pounds’ 
# that takes in an argument in pounds, converts it to 
# ounces, and then calls price_of_gold to give back the 
# final result. 

# Write a function called ‘price_of_gold_from_kilograms’ 
# that takes in an argument in kilograms, converts it to 
# ounces, and then calls ‘price_of_gold’ to return the cost 
# for the amount of gold in kilograms.


def price_of_gold(ounces)

    puts "That quantity of gold costs $#{ounces.to_f * 1336}."

end    
    


def price_of_gold_from_pounds(pounds)
    
    price_of_gold(pounds.to_f * 16)
    
end


def price_of_gold_from_kilograms(kilograms)
    
    price_of_gold(kilograms.to_f * 35.274)
    
end