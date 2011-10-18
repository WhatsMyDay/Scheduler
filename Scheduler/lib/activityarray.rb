require 'activity'

class ActivityArray < Array
   def load_from_file file_name
     f = File.open(file_name)
     while (line = f.gets) do
       activity = Activity.new()
       activity.decode_line(line)
       self << activity
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
