require 'task'

class TaskArray < Array
   def load_from_file file_name
     f = File.open(file_name)
     while (line = f.gets) do
       task = Task.new()
       task.decode_line(line)
       self << task
     end
     f.close()
   end

  def store_to_file file_name
    f = File.new(file_name, "w")
    self.each do | a |
       f.write(a.encode_line() + "\n")
    end
    f.close()
  end
end
