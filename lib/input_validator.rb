module InputValidator
  include Colors

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
end