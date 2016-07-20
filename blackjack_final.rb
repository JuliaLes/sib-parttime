
# Blackjack Capstone Project
# SI Ruby Parttime
# Julia Les 6/7/2016

# 7/20/16 TODO: Update Project to Utilize Best Practices

class Deck

    #TODO: Turn to Hash

    def initialize
        $deck = [["Ace of Hearts", 11],["King of Hearts", 10],["Queen of Hearts", 10],["Jack of Hearts", 10], \
                 ["Ten of Hearts", 10],["Nine of Hearts", 9],["Eight of Hearts", 8],["Seven of Hearts", 7], \
                 ["Six of Hearts", 6],["Five of Hearts", 5],["Four of Hearts", 4],["Three of Hearts", 3], \
                 ["Two of Hearts", 2],["Ace of Spades", 11],["King of Spades", 10],["Queen of Spades", 10], \
                 ["Jack of Spades", 10],["Ten of Spades", 10],["Nine of Spades", 9],["Eight of Spades", 8], \
                 ["Seven of Spades", 7],["Six of Spades", 6],["Five of Spades", 5],["Four of Spades", 4], \
                 ["Three of Spades", 3],["Two of Spades", 6],["Ace of Diamonds", 11],["King of Diamonds", 10], \
                 ["Queen of Diamonds", 10],["Jack of Diamonds", 10],["Ten of Diamonds", 10],["Nine of Diamonds", 9], \
                 ["Eight of Diamonds", 8],["Seven of Diamonds", 7],["Six of Diamonds", 6],["Five of Diamonds", 5], \
                 ["Four of Diamonds", 4],["Three of Diamonds", 3],["Two of Diamonds", 6],["Ace of Clubs", 11], \
                 ["King of Clubs", 10],["Queen of Clubs", 10],["Jack of Clubs", 10],["Ten of Clubs", 10], \
                 ["Nine of Clubs", 9],["Eight of Clubs", 8],["Seven of Clubs", 7],["Six of Clubs", 6], \
                 ["Five of Clubs", 5],["Four of Clubs", 4],["Three of Clubs", 3],["Two of Clubs", 6]]

        $deck.shuffle!
    end
end
    
class Player
    attr_accessor :name, :bankroll, :hand

    def initialize
        puts "\nWhat is the player's name?\n"
        @name = gets.chomp
        
        puts "\nWhat is #{@name}'s bank roll value?\n"
        @bankroll = gets.chomp.to_i
        
        @hand = [] 
    end

    def draws_card
        @hand << $deck.pop
    end

    def has_ace?
        if @hand.join(' ').include? "Ace"
            return true
        else
            return false
        end
    end

    def hand_sum
        ace_count = @hand.join(' ').scan(/Ace/).length
        sum = 0

        @hand.each do |card|
            sum += card[1]
        end

        while sum > 21 && ace_count > 0
            sum -= 10
            ace_count -= 1
        end
        sum
    end

    def has_natural?
        qualities = 0
        if has_ace? == true
            qualities += 1
        end
        if @hand.join(' ').include? "10"
            qualities += 1
        end
        qualities == 2 ? true : false
    end


    def show_card_names
        names = []
        @hand.each do |card|
            names << card[0]
        end
        return names.join(', ')
    end
    
    def display_full_hand
        puts "\n#{@name}'s hand is:\n"+ show_card_names
        puts "(sum = #{self.hand_sum})\n"
    end

    def adjust_bankroll(wager)
        @bankroll += wager
    end
    
    def give_options
        puts "\n#{@name} has #{@bankroll.to_i}$ in the bank roll.\n"
        puts "Would #{@name} like to cash out or keep playing?\n"
        reply = gets.chomp.downcase
        if reply == 'cash out'
            puts "\nGoodbye!\n"
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
        puts "\nThe dealer #{@name} is holding the #{@hand[0][0]}.\nThe other card is concealed.\n"
    end  
end

class Blackjack 
    def initialize
        puts "\nWelcome to Blackjack. Let's get started!\n"

        @dealer = Dealer.new
        @player = Player.new 

        self.play_new_game
    end

    def get_player_wager
        puts "\nHow much is #{@player.name} wagering for this game?\n" 
        @wager = gets.chomp.to_i

        until @wager <= @player.bankroll
            puts "It looks like #{@player.name} doesn't have enough money in the\nbank roll for that wager. Please enter a more\nreasonable value."
            @wager = gets.chomp.to_i
        end
    end

    def evaluate_natural
        if @player.has_natural? == true && @dealer.has_natural? == true
            puts "Both the Dealer and Player have Blackjack! It's a tie!"
            @dealer.display_full_hand
            @player.give_options
            play_new_game
        elsif @player.has_natural? == true
            puts "\nBLACKJACK! #{@player.name} wins!\n"
            @player.adjust_bankroll(@wager*(1.5))
            @player.give_options
            play_new_game
        elsif @dealer.has_natural? == true
            puts "\nBLACKJACK! #{@dealer.name} wins!\n"
            @dealer.display_full_hand
            @player.adjust_bankroll(-@wager)
            @player.give_options
            play_new_game
        end
    end

    def player_turn
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
        else 
            puts "\nNow it is #{@dealer.name}'s turn.\n"
            @dealer.display_full_hand
        end
    end

    def dealer_turn
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
        end
    end 

    def compare_hands
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

    def play_new_game
        if @player.bankroll <= 0
            puts "\nSorry, #{@player.name}, it looks like there is no money in your bank roll! Goodbye!\n"
            exit
        end

        while @player.bankroll > 0
            deck = Deck.new

            puts "\nLet's begin a new hand.\n"

            get_player_wager

            @dealer.hand.clear
            @player.hand.clear

            @dealer.draws_card
            @dealer.draws_card
            @player.draws_card
            @player.draws_card

            puts " "
            @dealer.display_part_hand
            puts " "
            @player.display_full_hand
            puts " "

            evaluate_natural
            
            player_turn  
            
            dealer_turn 

            compare_hands 
        end
    end
end

blackjack = Blackjack.new