require_relative "key_set"

class TypeTrainer
  
  def initialize(level = 1, line_size_max = 80)
    @level = level
    @key_set = KeySet.new()
    @line_size_max = line_size_max
    @word_size_max = 8
  end
  
  def doTraining()
    puts "$ level(#{@level})"
    out_line = nil
    part_line = nil
    while (true)
      if out_line == nil then
        out_line = get_next_line()
      end
      puts  "> #{out_line}"
      print "< " + (part_line != nil ? part_line : "")
      read_line = gets.chop
      in_line = (part_line != nil ? part_line : "") + read_line
      if read_line.eql?("$quit") then
        puts "$ bye."
        break
      elsif read_line.eql?("$up") && @level < KeySet::MAX_LEVEL then
        @level = @level + 1
        puts "$ level(#{@level})"
        out_line = nil
        part_line = nil
      elsif read_line.eql?("$down") && @level > KeySet::MIN_LEVEL then
        @level = @level - 1
        puts "$ level(#{@level})"
        out_line = nil
        part_line = nil
      elsif in_line.eql?(out_line) || read_line.eql?("$next") then
        out_line = nil
        part_line = nil
      else
        part_line = get_matching_part(out_line, in_line)
      end
    end
  end

:private

  def get_next_line()
    keys = @key_set.get_keys(@level)
    line =  ""
    word_length = 0
    while line.size < @line_size_max do
      if word_length == 0 then
        line << " "
        word_length = get_next_word_length()
        next
      end
      line << get_next_key(keys)
      word_length = word_length - 1
    end
    return line.strip
  end
  
  def get_next_word_length()
      return @word_size_max + Random.rand(@word_size_max / 2)
  end
    
  def get_next_key(keys)
    return keys[Random.rand(keys.size)]
  end
  
  def get_matching_part(string_1, string_2)
    part = ""
    for i in 0..string_2.size do
      if i < string_1.size && string_1[i] == string_2[i] then
        part << string_2[i]
      else
        break
      end
    end
    return part.size > 0 ? part : nil
  end
end