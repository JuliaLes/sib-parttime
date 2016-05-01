#  If we assume the cost of gold is $1,336 per ounce, what does the definition of price_of_gold look like?



def price_of_gold(ounces)

    puts "That quantity of gold costs $#{ounces.to_f * 1336}."

end    
    


def price_of_gold_from_pounds(pounds)
    
    price_of_gold(pounds.to_f * 16)
    
end


def price_of_gold_from_kilograms(kilograms)
    
    price_of_gold(kilograms.to_f * 35.274)
    
end