class Activity
  # To change this template use File | Settings | File Templates.


  attr_reader :ID, :Title, :Date, :Duration, :Description

  def decode_line input_string
    result = []
    input_string.split(" | ").each do | s |
      result << s.strip
    end
    result
  end





end