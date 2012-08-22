require_relative "key_set"

class TypeTrainer
  
  def initialize(key_set_level, line_size_max, word_size_max)
    @key_set = KeySet.new(key_set_level)
    @line_size_max = line_size_max
    @word_size_max = word_size_max
    @running = true
    @training = true
  end
  
  def run()
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
    info = "Level #{@key_set.get_level() + 1} (#{@key_set.get_size()} Keys)"
    print "$ #{info} [ <OK> / (u)p / (d)own / (q)uit ] : "
    input = gets.chop
    if input.size == 0 then
      @training = true
    elsif input.eql?("u") then
      @key_set.level_up()
    elsif input.eql?("d") then
      @key_set.level_down()
    elsif input.eql?("q") then
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
      print typed != nil ? "! #{typed}" : "< "
      input = gets.chop
      if input.size > 0 then
        input = typed != nil ? typed + input : input
        typed = get_match(output, input)
        if typed.eql?(output) then
          seconds = Time.new.to_i - start.to_i
          ratio = typed.size.to_f / seconds.to_f * 60
          puts "$ #{ratio.to_i} hits/min"
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
    size = 0
    while line.size < @line_size_max do
      if size == 0 then
        line << " "
        size = @word_size_max >= 2 ? @word_size_max - Random.rand(@word_size_max / 2) : @word_size_max
        next
      end
      line << @key_set.get_key()
      size = size - 1
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
