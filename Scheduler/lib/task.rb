
class Task
  attr_accessor :id, :title, :description, :priority, :location, :notes
  attr_writer :complete

  def complete?
    @complete
  end

  def initialize(num = nil, title = nil, desc = nil, prior = nil, location = nil, notes = nil)
    @id = num
    @title = title
    @description = desc
    @complete = false
    @priority = prior
    @location = location
    @notes = notes
  end

  def create_result_array(input_string)
    result = []
    input_string.split(" | ").each do |s|
      result << s.strip
    end
    result
  end

  def decode_line input_string
    result = create_result_array(input_string)
    @id = result[0].to_i
    @title = result[1]
    @description = result[2]
    @complete = result[3] == 'done'
    @priority = result[4]
    @location = result[5]
    @notes = result[6]
    result
  end

  def encode_line
    separator = " | "
    @id.to_s + separator + @title + separator + @description + separator + "#{@complete ? "done" : "not done"}" +separator + @priority +
        separator + @location + separator + @notes
  end

  def to_s()
    "#{@title} - #{@description} > #{ @complete ? "done" : "not done"}, #{@priority} in #{@location} #{@notes}"
  end
end



