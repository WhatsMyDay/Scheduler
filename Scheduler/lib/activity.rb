require 'activity_time'

class Activity
  attr_accessor :id, :title, :start_time, :duration, :description, :status, :priority

  def initialize(num = nil, title = nil, start_time = nil, dur = nil, desc = nil, prior = nil)
    @id = num
    @title = title
    @start_time = ActivityTime.new(start_time) if !start_time.nil?
    @duration = dur
    @description = desc
    @status = 'not done'
    @priority = prior
  end

  def decode_line input_string
    result = []
    input_string.split(" | ").each do |s|
      result << s.strip
    end
    @id = result[0].to_i
    @title = result[1]
    @start_time = ActivityTime.new(result[2])
    n = /(\d+):(\d\d)/.match(result[3])
    @duration = (n[1].to_i * 60) + n[2].to_i
    @description = result[4]
    @status = result[5]
    @priority = result[6]
    result
  end

  def encode_line
    separator = " | "
    @id.to_s + separator + @title + separator + "#{@start_time}" + separator + (@duration / 60).to_s.rjust(2, '0') + ":" +
        (@duration % 60).to_s.rjust(2, '0') + separator + @description + separator + @status +separator + @priority
  end

  def to_s()
    "#{@id}: #{@start_time} (#{@duration}) #{@title} - #{@description} > #{@status}, #{@priority}"
  end

  def change_status (stat)
    @status = stat
  end
end



