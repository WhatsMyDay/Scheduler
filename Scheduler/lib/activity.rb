class Activity
  # To change this template use File | Settings | File Templates.


  attr_accessor :id, :title, :date, :duration, :description



  def initialize(num=0, title="", date= "", dur="" , desc="" )

  def initialize(num = nil, title = nil, date = nil, dur = nil, desc = nil)


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
    @id = result[0].to_i
    @title = result[1]
    m = /(\d\d)\/(\d\d)\/(\d\d\d\d)\s(\d\d):(\d\d)/.match(result[2])
    @date = Time.mktime(m[3].to_i, m[2].to_i, m[1].to_i, m[4].to_i, m[5].to_i)
    n = /(\d+):(\d\d)/.match(result[3])
    @duration = (n[1].to_i * 60) + n[2].to_i
    @description = result[4]
    result
  end


  def to_s()
    "id:" + id.to_s + " title:" + title.to_s + "date:" + date.to_s + "duration:"+ duration.to_s + "description: " + description.to_s
  end



end


end



