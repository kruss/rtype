require_relative "key_set"

class TypeTrainer
  
  def initialize(line_size_max = 80, word_size_max = 8)
    @key_set = KeySet.new()
    @line_size_max = line_size_max
    @word_size_max = word_size_max
  end
  
  def run()
    @running = true
    @training = false
    while @running do
      if @training then
        do_training()
      else
        show_menu()
      end
    end
  end
    
:private
  
  def show_menu()
    puts "$ #{@key_set.get_info()} OK? [yes] / (u)p / (d)own / (q)uit"
    print "$ "
    input = gets.chop
    if input.size == 0 || input.eql?("y") || input.eql?("yes") then
      @training = true
    elsif input.eql?("u") || input.eql?("up") then
      @key_set.level_up()
    elsif input.eql?("d") || input.eql?("down") then
      @key_set.level_down()
    elsif input.eql?("q") || input.eql?("quit") then
      @running = false
    end
  end
  
  def do_training()
    output = nil
    part = nil
    while @training do
      if output == nil then
        output = get_line()
      end      
      puts  "> #{output}"
      print "< #{part != nil ? part : ""}"
      input = gets.chop
      if input.size > 0 then
        input = part != nil ? part + input : input
        if input.eql?(output) then
          output = nil
          part = nil
        else
          part = get_match(output, input)
        end
      else
        @training = false
      end
    end
  end

  def get_line()
    line =  ""
    word_length = 0
    while line.size < @line_size_max do
      if word_length == 0 then
        line << " "
        word_length = @word_size_max - Random.rand(@word_size_max / 2)
        next
      end
      line << @key_set.get_key()
      word_length = word_length - 1
    end
    return line.strip
  end
  
  def get_match(string_1, string_2)
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