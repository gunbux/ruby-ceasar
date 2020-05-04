#Creates a new hash that converts letters to numbers

numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]
letters = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']

$cipher_hash = Hash.new

for i in 0..25
  cipher = {letters[i]=>numbers[i]}
  $cipher_hash = $cipher_hash.merge(cipher)
end

$initial_cipher = Array.new

def ceasar_cipher(string,shift)
  #Converts the string into numbers and unused characters
  string.each_char do |letter|
    letter = letter.downcase
    if $cipher_hash[letter] != nil
      $initial_cipher.push($cipher_hash[letter])
    else
      $initial_cipher.push(letter)
    end
  end

  #Applies the shift to all the numbers in the array
end

ceasar_cipher('Hello World!',0)
print $initial_cipher
