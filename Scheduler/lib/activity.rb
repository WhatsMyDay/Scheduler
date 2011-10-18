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







  def decode_line input_string
    result = []
    input_string.split(" | ").each do | s |
      result << s.strip
    end
    result
  end

  def to_s()
    "id:" + id.to_s + " title:" + title.to_s + "date:" + date.to_s + "duration:" + duration.to_s + "description: " + description.to_s
  end



end



