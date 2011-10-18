require 'activity'

class ActivityArray < Array
   def load_from_file file_name
     f = File.open(file_name)
     line = f.gets
     puts line
     f.close()
     activity = Activity.new()
     activity.decode_line(line)
     self << activity
   end
end
