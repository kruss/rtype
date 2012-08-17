# unicodes: http://www.ulimatbach.de/links/unicode_entities.html

class KeySet  
  
  MIN_LEVEL = 1
  MAX_LEVEL = 7
  
  def initialize()
    @keys_4 = [  "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "\u00DF" ]
    @keys_3 = [  "q", "w", "e", "r", "t", "z", "u", "i", "o", "p", "\u00FC" ]
    @keys_2 = [  "a", "s", "d", "f", "g", "h", "j", "k", "l", "\u00F6", "\u00E4" ]
    @keys_1 = [  "y", "x", "c", "v", "b", "n", "m", ",", ".", "-" ]
    @cap_keys = [ 
      "Q", "W", "E", "R", "T", "Z", "U", "I", "O", "P", "\u00DC", "A", "S", "D", 
      "F", "G", "H", "J", "K", "L", "\u00D6", " \u00C4", "Y", "X", "C", "V", "B", "N", "M" 
    ]
    @special_1 = [ "<", ">", ";", ":", "_", "#", "'", "+", "*", "~" ]
    @special_2 = [ "/", "\\", "|", "(", ")", "[", "]", "{", "}", "=", "?" ]
    @special_3 = [] #[ "!", "\"", "§", "$", "%", "&", "´", "`", "^", "°", "@", "€" ]
  end
  
  def get_keys(level)
    keys = Array.new
    if level >= 1 then
      keys.concat(@keys_2)
    end
    if level >= 2 then
      keys.concat(@keys_3)
    end
    if level >= 3 then
      keys.concat(@keys_1)
    end
    if level >= 4 then
      keys.concat(@cap_keys)
    end
    if level >= 5 then
      keys.concat(@special_1)
    end
    if level >= 6 then
      keys.concat(@special_2)
    end
    if level >= 7 then
      keys.concat(@special_3)
    end
    return keys
  end
  
end