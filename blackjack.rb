
# Blackjack program as of 5/15/2016- in progress. Much work needed. 

    
class Player

    def initialize
        puts "\nWhat is the player's name?\n"
        @name = gets.chomp
        
        puts "\nWhat is #{@name}'s bank roll value?\n"
        @bankroll = gets.chomp.to_i
        
        puts "\nHow much is #{@name} wagering for this game?\n"
        @wager = gets.chomp.to_i
        
        @hand = []
        puts "\nThe player #{@name} is ready to begin.\n"
        
    end

    
    def draws_card
        @hand << $deck.pop
        puts "\nA card has been drawn\n"
    end
    
    
    def hand_sum
        @hand.inject(:+)
    end
    
    def display_full_hand
        puts "\n#{@name}'s hand is "+ @hand.join(',')
    end
             
end


class Dealer < Player


    def initialize
        puts "\nWhat is the dealer's name?\n"
        @name = gets.chomp
        @hand = []
        puts "\nThe dealer #{@name} is ready to begin.\n"
    end
      
    def display_part_hand
        puts "\nThe dealer #{@name} is holding a card with the value #{@hand[0]}. The other card is concealed.\n"
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
        puts "\nBUST! #{dealer.name} wins!\n"
        exit
    elsif player.hand_sum == 21
        puts "\nBLACKJACK! #{player.name} wins!\n"
        exit
    else 
        puts "\nNow it is the #{dealer.name}'s turn.\n"
    end
        
    
    # The dealer is making decisions    
    
    while dealer.hand_sum < 21
        if dealer.hand_sum < 17
            puts "\n#{dealer.name} has decided to hit.\n"
            dealer.draws_card
            dealer.display_full_hand
        elsif dealer.hand_sum >= 17
            puts "\n#{dealer.name} has decided to stay.\n"
            dealer.display_full_hand 
            break
        else 
            puts 'Please type "hit" or "stay."'
        end
    end
        
        
    if dealer.hand_sum > 21
        puts "\nBUST! #{player.name} wins!\n"
        exit
    elsif dealer.hand_sum == 21
        puts "\nBLACKJACK! #{dealer.name} wins!\n"
        exit
    end
    
    
    # Final comparison
    
    if dealer.hand_sum == player.hand_sum
        puts "\nIt's a tie!\n"
        exit
    elsif dealer.hand_sum > player.hand_sum
        puts "\n#{dealer.name} wins!\n"
        exit
    else
        puts "\n#{player.name} wins!\n"
        exit
    end
end
