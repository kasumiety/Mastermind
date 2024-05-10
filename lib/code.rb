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