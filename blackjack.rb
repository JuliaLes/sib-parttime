
# Blackjack program as of 5/14/2016- in progress. Much work needed. 

class Blackjack    

    def initialize
        puts "Welcome to Blackjack. Let's get started!"
    end

    class Deck
        def intitialize
            puts "creating deck"
            @@deck = (((1..9).to_a*4).concat [10]*16).shuffle!
        end
    end 


    
    class Dealer
        def initialize
            puts "What is the dealer's name?"
            @name = gets.chomp
            @hand = []
            puts "The dealer #{@name} is ready to begin."
        end
        
        def draws_card
            @hand << [@@deck.pop]
        end
        
        
        def hand_sum
            sum = @hand.inject(:+).to_i
        end
        
        
        def display_hand
            puts "The dealer #{@name} is holding a card with the value #{@hand[0].to_s}. The other card is concealed."
        end
                 
    end
    
    
    class Player < Dealer
        def initialize
            puts "What is the player's name? "
            @name = gets.chomp
            
            puts "What is #{@name}'s bank roll value? "
            @bankroll = gets.chomp.to_i
            
            puts "How much is #{@name} wagering for this game?"
            @wager = gets.chomp.to_i
            
            @hand = []
            puts "The player #{@name} is ready to begin."
            
        end
            
        def display_hand
            puts "The player #{@name} is holding the following: #{@hand.join(',')}."
        end

    end

    

    # Now we can begin the game
    

    dealer = Dealer.new
    player = Player.new
    
    dealer.draws_card
    dealer.draws_card
    player.draws_card
    player.draws_card
    
    puts " "
    dealer.display_hand
    puts " "
    player.display_hand
    puts " "
    
    
    #The player is making decisions
    
    while player.hand_sum < 21
        puts "Player- would you like to hit or stay?"
        player_choice = gets.chomp.downcase
        if player_choice == "hit"
            player.draws_card
            player.display_hand
        elsif player_choice == "stay"
            player.display_hand 
            break
        else 
            puts 'Please type "hit" or "stay."'
        end
    end
    
    if player.hand_sum > 21
        puts "BUST! The dealer wins!"
        exit
    elsif player.hand_sum == 21
        puts "BLACKJACK! The player wins!"
        exit
    else 
        puts "Now it is the dealer's turn."
    end
        
        
        
    
    # The dealer is making decisions    
    
    while dealer.hand_sum < 21
        puts "Dealer- would you like to hit or stay?"
        dealer_choice = gets.chomp.downcase
        if dealer_choice == "hit"
            dealer.draws_card
            dealer.display_hand
        elsif dealer_choice == "stay"
            dealer.display_hand 
            break
        else 
            puts 'Please type "hit" or "stay."'
        end
    end
        
        
    if dealer.hand_sum > 21
        puts "BUST! The player wins!"
        exit
    elsif player.hand_sum == 21
        puts "BLACKJACK! The dealer wins!"
        exit
    end
    
    
    # Final comparison
    
    if dealer.hand_sum == player.hand_sum
        puts "It's a tie!"
        exit
    elsif dealer.hand_sum > player.hand_sum
        puts "The dealer wins!"
        exit
    else
        puts "The player wins!"
        exit
    end
end
