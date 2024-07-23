

def cipher(string, shift)
  characters = string.split("")
  new_characters = []
  alpha_hash = generate_alphabets_hashes()

  for char in characters
    if alpha_hash.keys.include?(char.downcase)
      position = alpha_hash[char.downcase] + shift
      new_char = position <= 26 ?  alpha_hash.key(position) : alpha_hash.key(position - 26)
      new_char = char.is_lower? ? new_char : new_char.upcase

    else 
      new_char = char
    end
    new_characters.push(new_char)
  end

  new_characters.join("")
end


class String
  def is_upper?
    self == self.upcase
  end

  def is_lower?
    self == self.downcase
  end
end

def generate_alphabets_hashes()
    alphabets = "abcdefghijklmnopqrstuvwxyz".split("")
    alphabets_hash = {}
    counter = 1
    alphabets.each {|character| alphabets_hash[character] = counter; counter += 1}
   alphabets_hash
end

p cipher("What a string!", 5)
