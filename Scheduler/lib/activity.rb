require 'activity_time'

class Activity
  attr_accessor :id, :title, :start_time, :duration, :description, :is_done, :priority, :location, :notes

  def initialize(num = nil, title = nil, start_time = nil, dur = nil, desc = nil, prior = nil, location = nil, notes = nil)
    @id = num
    @title = title
    @start_time = ActivityTime.new(start_time) if !start_time.nil?
    @duration = dur
    @description = desc
    @is_done = false
    @priority = prior
    @location = location
    @notes = notes
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
    @is_done = result[5] == 'done'
    @priority = result[6]
    @location = result[7]
    @notes = result[8]
    result
  end

  def encode_line
    separator = " | "
    @id.to_s + separator + @title + separator + "#{@start_time}" + separator + (@duration.to_i / 60).to_s.rjust(2, '0') + ":" +
        (@duration % 60).to_s.rjust(2, '0') + separator + @description + separator + "#{@is_done ? "done" : "not done"}" +separator + @priority +
        separator + @location + separator + @notes
  end

  def to_s()
    "#{@start_time} (#{@duration}) #{@title} - #{@description} > #{ @is_done ? "done" : "not done"}, #{@priority} in #{@location} #{@notes}"
  end
end



