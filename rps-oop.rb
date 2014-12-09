# [Tealeaf - Week 2] Rock Paper Scissors Game

class Player
  attr_accessor :name, :choice
    
  def initialize(name)
    @name = name
  end

  def throw_sign
    begin
      puts "Pick one: Rock, Paper, Scissors"
      choice = gets.chomp.downcase.capitalize
    end until Game::CHOICES.include?(choice)

    self.choice = choice
  end
  
  def to_s
    "#{name} picks #{choice}."
  end

  # def throw_sign
  #   begin
  #     puts "Okay, Rock, Paper, or Scissors?"
  #     self.sign = Sign.new(gets.chomp.downcase.capitalize)
  #   end until CHOICES.include?(self.sign)
  #   puts "You threw #{self.sign}."
  # end
end

class Computer
  attr_accessor :name, :choice

  def initialize(name = "Droid")
    @name = name
  end

  def throw_sign
    self.choice = Game::CHOICES.sample
  end
end


class Game
  CHOICES = ["Rock", "Paper", "Scissors"]

  attr_reader :player, :computer

  def initialize
    @player = Player.new("Bobby")
    @computer = Computer.new("Farts")
  end

  def play
    player.throw_sign
    computer.throw_sign
    puts player.choice
    puts computer.choice
    
  end
end

game = Game.new.play
