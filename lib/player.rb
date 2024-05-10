class Player
  attr_accessor :guesses

  def initialize
    @guesses = 2
  end

  def guesses_left?
    guesses > 0
  end

  def decrement_guesses
    self.guesses -= 1
  end

  def display_guesses_left
    puts "You have #{guesses} guesses left"
  end

end