# unicodes: http://www.ulimatbach.de/links/unicode_entities.html

class KeySet  
  
  def initialize()
    @keys = Array.new
    @keys << [  "a", "s", "d", "f", "g", "h", "j", "k", "l", "\u00F6", "\u00E4" ]
    @keys << [  "q", "w", "e", "r", "t", "z", "u", "i", "o", "p", "\u00FC" ]
    @keys << [  "y", "x", "c", "v", "b", "n", "m", ",", ".", "-" ]
    @keys << [ 
      "Q", "W", "E", "R", "T", "Z", "U", "I", "O", "P", "\u00DC", "A", "S", "D", 
      "F", "G", "H", "J", "K", "L", "\u00D6", " \u00C4", "Y", "X", "C", "V", "B", "N", "M" 
    ]
    @keys << [  "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "\u00DF" ]
    @keys << [ "<", ">", ";", ":", "_", "#", "'", "+", "*", "~" ]
    @keys << [ "/", "\\", "|", "(", ")", "[", "]", "{", "}", "=", "?" ]
    #@keys << [ "!", "\"", "§", "$", "%", "&", "´", "`", "^", "°", "@", "€" ]
    @level = 0
    @set = get_keys()
  end
  
  def get_info()
    return "level #{@level + 1} (#{@set.size} keys)"
  end
  
  def level_up()
    if @level < @keys.size - 1 then
      @level = @level + 1
    end
    @set = get_keys()
  end
  
  def level_down()
    if @level > 0 then
      @level = @level - 1
    end
    @set = get_keys()
  end

  def get_key()
    return @set[Random.rand(@set.size)]
  end
  
:private
  
  def get_keys()
    keys = Array.new
    for i in 0..@level do
      keys.concat(@keys[i]) 
    end
    return keys
  end
  
end