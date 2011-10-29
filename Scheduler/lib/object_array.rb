class ObjectArray < Array
     def load_from_file file_name
     f = File.open(file_name)
     while (line = f.gets) do
       object = create_object
       object.decode_line(line)
       self << object
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

  def get_class_name()
    return (self.class.to_s.split("Array")).first
  end
  def create_object
          return eval(get_class_name).new
  end

end