=begin
  A simple pig latin translator based off codecademy's, but in Ruby. For Ruby practice.
  
  The rules:
    1. If the first letter is a consonant, move it to the end and add "ay"
    2. If the first letter is a vowel (ignoring "y"), just add "yay" to the end

    Source: https://en.wikipedia.org/wiki/Pig_Latin
=end

# Grab the word to be translated from the user.
print "Enter a ordway: "
original_word = gets.chomp

# Only proceed if the user entered something.
if original_word.length > 0
  # Create an array of words.
  words = original_word.split(" ")

  # Hashmap to keep track of janky words.
  violators = Hash.new

  # Our translated sentence.
  sentence = ""

  # Check each word in the array to ensure it only contains alphas.
  words.each do |word|
    if word.match(/^[[:alpha:]]+$/)
      # We have a winner! Lower case the word and grab the first letter. Format the word based upon the rules for pig latin.
      word.downcase!
      case word[0]
      when "a", "e", "i", "o", "u"
        sentence.concat(word << "yay ")
      else
        sentence.concat(word[1..word.length] << word[0] << "ay ")
      end
    else
      # We have a violator! Grab the current length of the hash and increment the value by one.
      violators[violators.length.next] = word
    end
  end

  # Show the translated text.
  puts sentence

  # Display the violators!
  if violators.length > 0
    puts "The following words could not be translated:"
    violators.each do |key, value|
  	  puts "#{key}. #{value}"
    end
  end
end