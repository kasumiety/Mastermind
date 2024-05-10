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