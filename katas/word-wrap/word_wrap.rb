# Split into array.
# Connect string with spaces until they are less than column_number
# Conect string with line breaks

# class Wrapper
#   def wrap(string, column_number)
#     return ""
#   end
# end

class Wrapper
  def self.wrap(string, column_to_wrap)
    recursive_wrap(string.reverse.scan(/\S+\s?/), column_to_wrap).reverse
  end
  
  def self.recursive_wrap(array, column)
    head = array[0]
    if head.scan(/.{1,#{column}}/).length > 1
      head = head.strip.reverse.scan(/.{1,#{column}}/).collect{ |c| c.reverse }.reverse.join("\n")
    end
    
    # remove trailing space on last word
    return head.strip if array.length == 1
    
    remainder = recursive_wrap(array[1..-1], column)
    
    line_length = remainder.index("\n") || remainder.length
    
    delimiter = head[-1]
    
    if line_length + head.length > column
      head.strip + "\n" + remainder
    else
      head.strip + delimiter + remainder
    end
  end
  
end
