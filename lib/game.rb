class Game
  include Colors
  include InputValidator

  def self.display_welcome_message
    puts "Welcome to Mastermind!"
  end

  def self.display_rules_for_guesser
    puts ""
    puts "In this game you will have 12 guesses to guess the secret color code."
    puts "The colors available are Red, Green, Blue, Yellow, White and Orange"
    puts "Your guesses should be formatted like this: "
    puts "'R G B B' for Red Green Blue Blue"
    puts ""
  end

  def self.display_rules_for_master
    puts ""
    puts "In this game you will have to set the secret color code that the CPU will try to crack in 12 tries."
    puts "The colors available are Red, Green, Blue, Yellow, White and Orange"
    puts "Your secret code should be formatted like this: "
    puts "'R G B B' for Red Green Blue Blue"
    puts ""
  end

  #NEED TO FINISH
  def set_cpu_difficulty
    puts "Please set CPU difficulty.(Easy/Medium/Nightmare)"
    loop do
      choice = gets.chomp.upcase
      if choice == "EASY"
        return 1
      elsif choice == "MEDIUM"
        # TO DO
        puts "This difficulty is currently unavailable. It may be implemented one day, for now setting it to Easy."
        return 1
      elsif choice == "NIGHTMARE"
        puts "This difficulty is currently unavailable. It may be implemented one day, for now setting it to Easy."
        return 1
      end
    end
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

  def display_master_win_message
    puts ""
    puts "The CPU is out of guesses!"
    puts "You win this round."
  end

  def display_master_loss_message
    puts ""
    puts "The CPU has successfully deciphered your code!"
    puts "You lose this round."
  end

  def display_guesser_loss_message
    puts ""
    puts "Sorry, you're out of guesses!"
    puts "You lose this round."
  end

  def display_guesser_win_message
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