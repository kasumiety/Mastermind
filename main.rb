module Colors
  AVAILABLE_COLORS = ["R", "G", "B", "Y", "W", "O"]

  def get_available_colors
    AVAILABLE_COLORS
  end
end

class Game
  include Colors

  def self.display_welcome_message
    puts "Welcome to Mastermind!"
  end

  def self.display_rules
    puts ""
    puts "In this game you will have 12 guesses to guess the secret code."
    puts "The colors available are Red, Green, Blue, Yellow, White and Orange"
    puts "Your guesses should be formatted like this: "
    puts "'R G B B' for Red Green Blue Blue"
    puts ""
  end

  def prompt_for_choice
    puts "Please enter your choices: "
    p_choice = ""
    loop do
      p_choice = gets.chomp
      if valid_input?(p_choice)
        return p_choice.split
      else
        puts "Please enter your choice in the required format (e.g. 'R Y B W')."
      end
    end
  end

  def valid_input?(p_input)
    input_arr = p_input.split
    if input_arr.length != 4
      return false
    end
    valid_colors = get_available_colors
    input_arr.each do |color|
      unless valid_colors.include?(color)
        return false
      end
    end
    return true
  end

  def display_loss_message
    puts ""
    puts "Sorry, you're out of guesses!"
    puts "You lose this round."
  end

  def display_win_message
    puts ""
    puts "You've correctly deciphered the code."
    puts "You win this round!"
  end

  def self.play_again?
    puts "Do you want to play again?(Y/N)"
    loop do
      choice = gets.chomp
      if choice.upcase == "Y"
        return true
      elsif choice.upcase == "N"
        return false
      end
    end
  end

  def self.display_ending_message
    puts "Thank you for playing!"
  end
end

class Code
  include Colors

  attr_accessor :secret

  def initialize
    @secret = []
  end

  def set_random_code
    valid_colors = get_available_colors
    4.times do
      self.secret.push(valid_colors.sample)
    end
  end

  def correct?(guess)
    guess == secret
  end

  def display_num_of_correct_positions(guess)
    correct_pos = 0
    i = 0
    while i < guess.length
      if guess[i] == secret[i]
        correct_pos += 1
      end
      i += 1
    end
    puts "Colors in correct positions: #{correct_pos}"
  end

  def display_num_of_correct_colors(guess)
    correct_colors = 0
    already_counted = []
    guess.each_with_index do |color, idx|
      if color == secret[idx]
        already_counted.push(color)
      end
    end

    guess.each do |color|
      if secret.include?(color)
        if already_counted.include?(color)
          next
        else
          correct_colors += 1
          already_counted.push(color)
        end
      end
    end
    puts "Correct colors in incorrect positions: #{correct_colors}"
  end


end

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

while true

  # Start new game and display the rules
  game = Game.new
  player = Player.new

  Game.display_welcome_message
  Game.display_rules

  # Initializes and sets the secret code
  code = Code.new
  code.set_random_code

  # Game flow loop
  while true

    # Checks if there are guesses still available
    unless player.guesses_left?
      game.display_loss_message
      break
    end

    choice = game.prompt_for_choice
    if code.correct?(choice)
      game.display_win_message
      break
    else
      code.display_num_of_correct_positions(choice)
      code.display_num_of_correct_colors(choice)
    end

    # FOR TESTING ONLY
    puts "The secret code is #{code.secret}!"
    
    player.decrement_guesses
    player.display_guesses_left

  end

  #Ask if the player wants to play another match
  if Game.play_again?
    next
  else
    Game.display_ending_message
    exit 0
  end
end