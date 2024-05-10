require_relative 'lib/colors'
require_relative 'lib/game'
require_relative 'lib/code'
require_relative 'lib/player'

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