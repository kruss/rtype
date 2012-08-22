# unicodes: http://www.ulimatbach.de/links/unicode_entities.html

class KeySet  
  
  def initialize(level = 0)
    set_layout()
    set_level(level)
  end
  
  def get_level()
    return @level
  end
  
  def get_size()
    return @key_set.size
  end
  
  def set_level(level)
    if level >= 0 && level <= @key_layout.size - 1 then
      @level = level
    end
    @key_set = get_keys()
  end
  
  def level_up()
    if @level < @key_layout.size - 1 then
      @level = @level + 1
    end
    @key_set = get_keys()
  end
  
  def level_down()
    if @level > 0 then
      @level = @level - 1
    end
    @key_set = get_keys()
  end

  def get_key()
    return @key_set[Random.rand(@key_set.size)]
  end
  
:private
  
  def set_layout()
    @key_layout = Array.new
    @key_layout << [  "a", "s", "d", "f", "g", "h", "j", "k", "l", "\u00F6", "\u00E4" ]
    @key_layout << [  "q", "w", "e", "r", "t", "z", "u", "i", "o", "p", "\u00FC" ]
    @key_layout << [  "y", "x", "c", "v", "b", "n", "m", ",", ".", "-" ]
    @key_layout << [ 
      "Q", "W", "E", "R", "T", "Z", "U", "I", "O", "P", "\u00DC", "A", "S", "D", 
      "F", "G", "H", "J", "K", "L", "\u00D6", " \u00C4", "Y", "X", "C", "V", "B", "N", "M" 
    ]
    @key_layout << [  "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "\u00DF" ]
    @key_layout << [ "<", ">", ";", ":", "_", "#", "'", "+", "*", "~" ]
    @key_layout << [ "/", "\\", "|", "(", ")", "[", "]", "{", "}", "=", "?" ]
    #@key_layout << [ "!", "\"", "§", "$", "%", "&", "´", "`", "^", "°", "@", "€" ]
  end

  def get_keys()
    keys = Array.new
    for i in 0..@level do
      keys.concat(@key_layout[i]) 
    end
    return keys
  end
  
end