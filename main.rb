require_relative 'lib/colors'
require_relative 'lib/input_validator'
require_relative 'lib/game'
require_relative 'lib/code'
require_relative 'lib/player'

while true

  # Start new game and display the rules
  game = Game.new
  player = Player.new

  Game.display_welcome_message
  player.set_role

  unless player.is_human?
    difficulty = game.set_cpu_difficulty
  end

  player.is_human? ? Game.display_rules_for_guesser : Game.display_rules_for_master

  # Initializes and sets the secret code
  code = Code.new
  player.is_human? ? code.set_random_code : code.prompt_player_for_code

  puts "========================"

  # Game flow loop
  while true

    if player.is_human?
      choice = game.prompt_for_choice
    else
      choice = player.generate_cpu_choice(difficulty)
      puts "The CPU chose #{choice}"
    end

    if code.correct?(choice)
      if player.is_human?
        game.display_guesser_win_message
      else
        game.display_master_loss_message
      end
      break
    else
      code.display_num_of_correct_positions(choice)
      code.display_num_of_correct_colors(choice)
    end

    # FOR TESTING ONLY
    puts "The secret code is #{code.secret}!"
    
    player.decrement_guesses
    player.display_guesses_left

    puts "========================"

    # Checks if there are guesses still available
    unless player.guesses_left?
      if player.is_human?
        game.display_guesser_loss_message
      else
        game.display_master_win_message
      end
      break
    end

    unless player.is_human?
      sleep(2)
    end

  end

  #Ask if the player wants to play another match
  if Game.play_again?
    next
  else
    Game.display_ending_message
    exit 0
  end
end

# To do: finish set_cpu_difficulty function and create different patterns of behavior