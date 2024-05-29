class Player
  include Colors

  attr_accessor :guesses, :human

  def initialize
    @guesses = 2
    @human = false
  end

  def set_role
    puts "Do you want to be the game master?(Y/N)"
    loop do
      choice = gets.chomp
      if choice.upcase == "Y"
        self.human = false
        break
      elsif choice.upcase == "N"
        self.human = true
        break
      end
    end
  end

  def is_human?
    human
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

  def generate_cpu_choice
    cpu_choice = []
    valid_colors = get_available_colors
    4.times do
      cpu_choice.push(valid_colors.sample)
    end
    cpu_choice
  end

end