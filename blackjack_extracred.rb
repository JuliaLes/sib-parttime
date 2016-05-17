
# Blackjack program with extra credit as of 5/17/2016- in progress.  


class Deck
    def initialize
        puts "\nA shuffled deck of cards is ready for use.\n"
        $deck = (((1..9).to_a*4).concat [10]*16).shuffle!
    end
end

    
class Player

    def initialize
        puts "\nWhat is the player's name?\n"
        @name = gets.chomp
        
        puts "\nWhat is #{@name}'s bank roll value?\n"
        @bankroll = gets.chomp.to_i

        @wager = 0
        
        @hand = [] 
    end

    def name
        @name
    end

    def bankroll
        @bankroll
    end

    def wager
        @wager
    end

    def hand
        @hand
    end

    def draws_card
        @hand << $deck.pop
        puts "(a card is drawn)"
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
    end
      
    def display_part_hand
        puts "\nThe dealer #{@name} is holding a card with the value #{@hand[0]}. The other card is concealed.\n"
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
            puts "Sorry- It looks like there is no money in your bank roll! Goodbye!"
            exit
        end

        while @player.bankroll > 0

            deck = Deck.new

            puts "\nLet's begin a new game!\n"

            @dealer.hand.clear
            @player.hand.clear

            puts "\nHow much is #{@player.name} wagering for this game?\n"
            @wager = gets.chomp.to_i

            until @wager < @player.bankroll
                puts "It looks like you don't have enough money in your bank roll for that wager.\nPlease enter a more reasonable value."
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
                play_new_game
            elsif @player.hand_sum == 21
                puts "\nBLACKJACK! #{@player.name} wins!\n"
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
                play_new_game
            elsif @dealer.hand_sum == 21
                puts "\nBLACKJACK! #{@dealer.name} wins!\n"
                play_new_game
            end
            
            
            # Final comparison
            
            if @dealer.hand_sum == @player.hand_sum
                puts "\nIt's a tie!\n"
                play_new_game
            elsif @dealer.hand_sum > @player.hand_sum
                puts "\n#{@dealer.name} wins!\n"
                play_new_game
            else
                puts "\n#{@player.name} wins!\n"
                play_new_game
            end
        end

    end
end

blackjack = Blackjack.new

