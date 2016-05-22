

# Blackjack SI Homework with Extra Credit Features
# Julia Les 5/14/2016
  
# Prompt: Create a program that allows a user to
# play a game of Blackjack using command prompt.
# Make BlackJack, Player, and Dealer classes.
# You will need a deck of cards that only supports 1 
# to 10, with 52 cards total. Face and Suits are not necessary.
# Player should be asked to enter their name and have a bank roll. 
# Allow the Player to wager an amount on the game. 
# 
# Extra credit: Keep the game going until the Player has no 
# more money in his bankroll or if he says exit.




class Deck
    def initialize
        $deck = (((1..9).to_a*4).concat [10]*16).shuffle!
    end
end

    
class Player

    def initialize
        puts "\nWhat is the player's name?\n"
        @name = gets.chomp
        
        puts "\nWhat is #{@name}'s bank roll value?\n"
        @bankroll = gets.chomp.to_i
        
        @hand = [] 
    end

    def name
        @name
    end

    def bankroll
        @bankroll
    end

    def hand
        @hand
    end

    def draws_card
        @hand << $deck.pop
    end
    
    def hand_sum
        @hand.inject(:+)
    end
    
    def display_full_hand
        puts "\n#{@name}'s hand is "+ @hand.join(',')
    end

    def adjust_bankroll(w)
        @bankroll += w
    end
    
    def give_options
        puts "\n#{@name} has #{@bankroll}$ in the bank roll.\n"
        puts "Would #{@name} like to cash out or keep playing?\n"
        reply = gets.chomp.downcase
            if reply == 'cash out'
                puts "Goodbye!"
                exit
            elsif reply == 'keep playing'
                puts "\nGreat!\n"
            else 
                puts "Please type 'cash out' or 'keep playing'."
                give_options
            end
    end   
             
end


class Dealer < Player


    def initialize
        puts "\nWhat is the dealer's name?\n"
        @name = gets.chomp
        @hand = []
    end
      
    def display_part_hand
        puts "\nThe dealer #{@name} is holding a card with the value #{@hand[0]}.\nThe other card is concealed.\n"
    end  

end




class Blackjack 

    def initialize
 
        puts "\nWelcome to Blackjack. Let's get started!\n"

        @dealer = Dealer.new
        @player = Player.new 

        self.play_new_game

    end


    # Game mechanics for each new hand of blackjack

    def play_new_game

        if @player.bankroll <= 0
            puts "\nSorry, #{@player.name}, it looks like there is no money in your bank roll! Goodbye!\n"
            exit
        end

        while @player.bankroll > 0

            deck = Deck.new

            puts "\nLet's begin a new hand.\n"

            @dealer.hand.clear
            @player.hand.clear

            puts "\nHow much is #{@player.name} wagering for this game?\n" 
            @wager = gets.chomp.to_i


            until @wager <= @player.bankroll
                puts "It looks like #{@player.name} doesn't have enough money in the\nbank roll for that wager. Please enter a more\nreasonable value."
                @wager = gets.chomp.to_i
            end

            
            @dealer.draws_card
            @dealer.draws_card
            @player.draws_card
            @player.draws_card
            
            puts " "
            @dealer.display_part_hand
            puts " "
            @player.display_full_hand
            puts " "
            
            
            #The player is making decisions   
            
            while @player.hand_sum < 21
                puts "\n#{@player.name}, would you like to hit or stay?\n"
                @player_choice = gets.chomp.downcase
                if @player_choice == "hit"
                    @player.draws_card
                    @player.display_full_hand
                elsif @player_choice == "stay"
                    @player.display_full_hand 
                    break
                else 
                    puts 'Please type "hit" or "stay."'
                end
            end
            
            if @player.hand_sum > 21
                puts "\nBUST! #{@dealer.name} wins!\n"
                @player.adjust_bankroll(-@wager)
                @player.give_options
                play_new_game
            elsif @player.hand_sum == 21
                puts "\nBLACKJACK! #{@player.name} wins!\n"
                @player.adjust_bankroll(@wager)
                @player.give_options
                play_new_game
            else 
                puts "\nNow it is #{@dealer.name}'s turn.\n"
                @dealer.display_full_hand
            end
                
            
            # The dealer is making decisions    
            
            while @dealer.hand_sum < 21
                if @dealer.hand_sum < 17
                    puts "\n#{@dealer.name} has decided to hit.\n"
                    @dealer.draws_card
                    @dealer.display_full_hand
                elsif @dealer.hand_sum >= 17
                    puts "\n#{@dealer.name} has decided to stay.\n"
                    break
                else 
                    puts 'Please type "hit" or "stay."'
                end
            end
                
                
            if @dealer.hand_sum > 21
                puts "\nBUST! #{@player.name} wins!\n"
                @player.adjust_bankroll(@wager)
                @player.give_options
                play_new_game
            elsif @dealer.hand_sum == 21
                puts "\nBLACKJACK! #{@dealer.name} wins!\n"
                @player.adjust_bankroll(-@wager)
                @player.give_options
                play_new_game
            end
            
            
            # Final comparison
            
            if @dealer.hand_sum == @player.hand_sum
                puts "\nIt's a tie!\n"
                @player.give_options
                play_new_game
            elsif @dealer.hand_sum > @player.hand_sum
                puts "\n#{@dealer.name} wins!\n"
                @player.adjust_bankroll(-@wager)
                @player.give_options
                play_new_game
            else
                puts "\n#{@player.name} wins!\n"
                @player.adjust_bankroll(@wager)
                @player.give_options
                play_new_game
            end
        end

    end
end

blackjack = Blackjack.new

