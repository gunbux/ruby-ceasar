#Creates a new hash that converts letters to numbers

numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]
letters = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']

$cipher_hash = Hash.new
$uncipher_hash = Hash.new

for i in 0..25
  cipher = {letters[i]=>numbers[i]}
  $cipher_hash = $cipher_hash.merge(cipher)

  uncipher = {numbers[i]=>letters[i]}
  $uncipher_hash = $uncipher_hash.merge(uncipher)
end


def ceasar_cipher(string,shift)

  $initial_cipher = Array.new

  #Converts the string into numbers and unused characters
  shifted_cipher = Array.new
  string.each_char do |letter|
    letter = letter.downcase
    if $cipher_hash[letter] != nil
      $initial_cipher.push($cipher_hash[letter])
    else
      $initial_cipher.push(letter)
    end
  end

  #Applies the shift to all the numbers in the array
  $initial_cipher.each do |cipher|
    if cipher.is_a?(Integer)
      cipher += shift

      #Check if shift goes over the range
      if cipher > 26
        cipher -= 26
      end

      shifted_cipher.push(cipher)
    else
      shifted_cipher.push(cipher)
      next
    end
  end

  #Converts the cipher back into readable words
  final_string = Array.new
  shifted_cipher.each do |thing|
    if thing.is_a?(Integer)
      final_string.push($uncipher_hash[thing])
    else
      final_string.push(thing)
    end
  end

  #Checks for caps with the original string and shifts it if it is caps

  for i in 0...string.length
    #puts "Checking #{string[i]} for upcase"
    if string[i] == string[i].upcase
      final_string[i] = final_string[i].upcase
    end
  end

  #Convert the Array to string
  output = ""
  final_string.each do |alphabet|
    output += alphabet
  end

  return output

end

puts ceasar_cipher('Hello World!',1)
puts ceasar_cipher('What a string!',5)
