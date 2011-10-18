class Activity
  # To change this template use File | Settings | File Templates.


  attr_accessor :id, :title, :date, :duration, :description



  def initialize(num, title, date , dur , desc )

    @id = num
    @title = title
    @date = date
    @duration = dur
    @description = desc

  end





end

  def decode_line input_string
    result = []
    input_string.split(" | ").each do | s |
      result << s.strip
    end
    result
  end





