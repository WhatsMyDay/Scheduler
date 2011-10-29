class ActivityTime
  include Comparable

  attr_accessor :time

  def initialize(time_string)
    m = /(\d\d)\/(\d\d)\/(\d\d\d\d)\s(\d\d):(\d\d)/.match(time_string)
    @time = Time.mktime(m[3].to_i, m[2].to_i, m[1].to_i, m[4].to_i, m[5].to_i)
  end

  def <=> another
    @time <=> another.time
  end

  def to_s
    @time.day.to_s.rjust(2, '0') + "/" + @time.month.to_s.rjust(2, '0') + "/" +
        @time.year.to_s.rjust(2, '0') + " " + @time.hour.to_s.rjust(2, '0') +
        ":" + @time.min.to_s.rjust(2, '0')
  end
end