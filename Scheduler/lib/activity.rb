class Activity
  # To change this template use File | Settings | File Templates.


  attr_accessor :id, :title, :date, :duration, :description



  def initialize(num=0, title="", date= "", dur="" , desc="" )

    @id = num
    @title = title
    @date = date
    @duration = dur
    @description = desc

  end


  def list ()

    puts("Activity ID is "+ id )



  end


end

  def decode_line input_string
    result = []
    input_string.split(" | ").each do | s |
      result << s.strip
    end
    result
  end





