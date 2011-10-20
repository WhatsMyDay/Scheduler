class Activity
  attr_accessor :id, :title, :date, :duration, :description, :status

  def initialize(num = nil, title = nil, date = nil, dur = nil, desc = nil, stat='not done')
    @id = num
    @title = title
    @date = date
    @duration = dur
    @description = desc
    @status = stat
  end

  def decode_line input_string
    result = []
    input_string.split(" | ").each do |s|
      result << s.strip
    end
    @id = result[0].to_i
    @title = result[1]
    m = /(\d\d)\/(\d\d)\/(\d\d\d\d)\s(\d\d):(\d\d)/.match(result[2])
    @date = Time.mktime(m[3].to_i, m[2].to_i, m[1].to_i, m[4].to_i, m[5].to_i)
    n = /(\d+):(\d\d)/.match(result[3])
    @duration = (n[1].to_i * 60) + n[2].to_i
    @description = result[4]
    @status = result[5]
    result
  end

  def encode_line
    separator = " | "
    @id.to_s + separator + @title + separator + @date.day.to_s.rjust(2, '0') + "/" +
        @date.month.to_s.rjust(2, '0') + "/" + @date.year.to_s.rjust(2, '0') + " " + @date.hour.to_s.rjust(2, '0') +
        ":" + @date.min.to_s.rjust(2, '0') + separator + (@duration / 60).to_s.rjust(2, '0') + ":" +
        (@duration % 60).to_s.rjust(2, '0') + separator + @description + separator + @status
  end

  def to_s()
    "id:" + id.to_s + " title:" + title.to_s + "date:" + date.to_s + "duration:" + duration.to_s + "description:" +
        description.to_s + "status:" + status.to_s
  end

  def change_status (stat)

    @status = stat

  end


end



