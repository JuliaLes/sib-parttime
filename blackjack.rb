
# Blackjack program as of 5/15/2016- in progress. Much work needed. 

    
class Player

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

    
    def draws_card
        @hand << [$deck.pop]
        puts "A card has been drawn"
    end
    
    
    def hand_sum
        sum = @hand.inject(:+).to_i
    end
    
    def display_full_hand
        puts "#{@name}'s hand is' "+ @hand.join(', ')
    end
             
end


class Dealer < Player


    def initialize
        puts "What is the dealer's name?"
        @name = gets.chomp
        @hand = []
        puts "The dealer #{@name} is ready to begin."
    end
      
    def display_part_hand
        puts "The dealer #{@name} is holding a card with the value #{@hand[0].to_s}. The other card is concealed."
    end  

end


class Blackjack    


    puts "\nWelcome to Blackjack. Let's get started!\n"
        

    class Deck
        puts "\nA shuffled deck of cards is ready to use.\n"
        $deck = (((1..9).to_a*4).concat [10]*16).shuffle!
    end

    deck = Deck.new

    dealer = Dealer.new
    player = Player.new
    
    dealer.draws_card
    dealer.draws_card
    player.draws_card
    player.draws_card
    
    puts " "
    dealer.display_part_hand
    puts " "
    player.display_full_hand
    puts " "
    
    
    #The player is making decisions
    
    while player.hand_sum < 21
        puts "\nPlayer- would you like to hit or stay?\n"
        player_choice = gets.chomp.downcase
        if player_choice == "hit"
            player.draws_card
            player.display_full_hand
        elsif player_choice == "stay"
            player.display_full_hand 
            break
        else 
            puts 'Please type "hit" or "stay."'
        end
    end
    
    if player.hand_sum > 21
        puts "\nBUST! The dealer wins!\n"
        exit
    elsif player.hand_sum == 21
        puts "\nBLACKJACK! The player wins!\n"
        exit
    else 
        puts "\nNow it is the dealer's turn.\n"
    end
        
    
    # The dealer is making decisions    
    
    while dealer.hand_sum < 21
        if dealer_hand_sum < 17
            puts "\nThe dealer has decided to hit.\n"
            dealer.draws_card
            dealer.display_full_hand
        elsif dealer_hand_sum >= 17
            puts "\nThe dealer has decided to stay.\n"
            dealer.display_full_hand 
            break
        else 
            puts 'Please type "hit" or "stay."'
        end
    end
        
        
    if dealer.hand_sum > 21
        puts "\nBUST! The player wins!\n"
        exit
    elsif player.hand_sum == 21
        puts "\nBLACKJACK! The dealer wins!\n"
        exit
    end
    
    
    # Final comparison
    
    if dealer.hand_sum == player.hand_sum
        puts "\nIt's a tie!\n"
        exit
    elsif dealer.hand_sum > player.hand_sum
        puts "\nThe dealer wins!\n"
        exit
    else
        puts "\nThe player wins!\n"
        exit
    end
end
