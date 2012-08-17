require_relative "key_set"

class TypeTrainer
  
  def initialize(line_size_max = 20, word_size_max = 8)
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
    puts "$ #{@key_set.info()} OK? [yes] / (u)p / (d)own / (q)uit"
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
    typed = nil
    while @training do
      if output == nil then
        output = get_line()
        start = Time.new
      end      
      puts  "> #{output}"
      print "< #{typed != nil ? typed : ""}"
      input = gets.chop
      if input.size > 0 then
        input = typed != nil ? typed + input : input
        typed = get_match(output, input)
        if typed.eql?(output) then
          seconds = Time.new.to_i - start.to_i
          ratio = typed.size.to_f / seconds.to_f * 60
          puts "$ done (#{ratio.to_i} hit/min)"
          output = nil
          typed = nil 
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
  
  def get_match(from, to)
    match = ""
    for i in 0..from.size do
      if i < to.size && from[i] == to[i] then
        match << from[i]
      else
        break
      end
    end
    return match
  end
  
end