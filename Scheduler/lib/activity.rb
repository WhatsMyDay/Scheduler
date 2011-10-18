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


  def list ()

    puts("Activity ID is "+ id )



  end


end







