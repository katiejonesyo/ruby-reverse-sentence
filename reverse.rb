# Reverse the order of words in a given sentence (an array of characters). Take the “Hello World” string for example: Hello World  - World Hello.
# Hint - Notice how the words are seperated by white space.

# The exclamation mark (“!”) symbol, called a “bang,” is the logical “not” operator. Placed in front of a boolean value it will reverse the value, returning the opposite. ... Just like a conditional if statement, a bang (“!”) creates a boolean context.

def str_rev(str, from, to)
    if(!str || str.length < 2)
    return
    end
# The code above is saying "if no string or string length is less than 2 then return nothing"
# The next section is saying "Okay BUT while from is less than to, then return string"
    while (from < to)
    temp = str[from]
    str = str[0, from] + str[to] + str[from + str[to].length .. -1]  
    str = str[0, to] + temp + str[to + temp.length .. -1]

    from+=1
    to-=1
    end
    return str
end


def reverse_words(sentence)
    # This sentence is a nil-terminated string thats ends with char '\0'.
    if (!sentence || sentence.length == 0)
    return 
    end
    # If no sentence or sentence length is == 0 then return nothing

  #  To reverse all words in the string, we will first reverse
  #  the string. Now all the words are in the desired location, but
  #  in reverse order: "Hello World" -> "dlroW olleH".

  str_len = sentence.length
  sentence = str_rev(sentence, 0, str_len -1)

  # Now, iterate the sentence and reverse each word in place.
  # "dlroW olleH" -> "World Hello"

  from = 0
  to = 0

  while (true)
    # find the 'from' index of a word while skipping spaces.
  while (sentence[from] == ' ')
    from+=1
  end
  if (from >= sentence.length)
    break
  end


	# find the 'to' index of the word.
    to = from + 1

    while(to < sentence.length && sentence[to] != ' ')
        to+=1
    end

    # reverse the word in-place.
    sentence = str_rev(sentence, from, to -1)

    from = to
    end
    return sentence
end

s = "Hello World!"
puts(s)
s = reverse_words (s)
puts(s)


