# [Tealeaf - Week 2] Rock Paper Scissors Game
############################################
class Hand
  include Comparable
  attr_reader :value

  def initialize(value)
    @value = value
  end
#__________________________________________

  def <=>(other_hand)
    if @value == other_hand.value
      0
    elsif (@value == 'Paper' && other_hand.value == 'Rock') || (@value == 'Rock' && other_hand.value == 'Scissors') || (@value == 'Scissors' && other_hand.value == 'Paper')
      1
    else
      -1
    end  
  end
#__________________________________________
  def display_winning_message
    case @value
    when 'Rock'
      puts "Rock beats scissors." 
    when 'Paper'
      puts "Paper beats rock."
    when 'Scissors'
      puts "Scissors beats paper."
    end
  end
end
#__________________________________________

class Player
  attr_accessor :hand 
  attr_reader :name

  def initialize(name)
      @name = name
  end

  def to_s
    "#{name} picks #{self.hand.value}."
  end
end
#__________________________________________

class Human < Player
  
  def throw_sign
    begin
      puts "Pick one: Rock, Paper, Scissors"
      c = gets.chomp.downcase.capitalize
    end until Game::CHOICES.include?(c)

    self.hand = Hand.new(c)
    puts "You picked #{self.hand.value}"
  end
end
#__________________________________________

class Computer < Player

  def initialize(name = "Droid")
    @name = name
  end

  def throw_sign
    self.hand = Hand.new(Game::CHOICES.sample)
    puts "Computer picked #{self.hand.value}"
  end
end

# Mechanics
############################################
class Game
  CHOICES = ["Rock", "Paper", "Scissors"]
  attr_reader :player, :computer

  def initialize
    @player = Human.new("Bobby")
    @computer = Computer.new("Farts")
  end

  def welcome_message
    puts "Hey! Time to play Rock Paper Scissors. Let's go!"
    puts "==================================="
  end

  def compare_hands
    if player.hand == computer.hand
      puts "It's a tie"
    elsif player.hand > computer.hand
      player.hand.display_winning_message
      puts "#{player.name} won!"
    else 
      computer.hand.display_winning_message
      puts "#{computer.name} won. Bummer."
    end 
  end

  def replay_message
    puts "Want to play again? (Yes/No)"
  end

  def play
    welcome_message
    begin 
      player.throw_sign
      computer.throw_sign
      compare_hands
      replay_message
    end until gets.chomp.downcase.include?('no')
    
  end
end

Game.new.play
