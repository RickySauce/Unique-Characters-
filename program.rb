require 'pry'


# create new paragraph array variable, split on every character
# creat empty hash to store unique characters and the number of times they occur
# create new key for unique characters if key doesnt exist, if key exists add 1 for each time that character appears
# total count method, counts the value of every key of the hash and returns a total.
# go through every key, create a new array with unique characters, deletes key from hash
# sort hash from least to greatest for largest array
# create stop_loop= false  while false, loop, if true, stop
# stop_loop = true if total_count will drop below 50 on deletion
# when loop breaks return array with unique characters.


paragraph = "If you want to jumpstart the process of talking to us about this role, here’s a little challenge: write a program that outputs the largest unique set of characters that can be removed from this paragraph without letting its length drop below 50."


def total_count(hash)
  count = 0
  hash.each{|key,value| count += value}
  count
end

def get_unique_characters(paragraph)
  paragraph_array = paragraph.split('')
  paragraph_hash = {}
  unique_characters = []

  paragraph_array.each do |el|
    if paragraph_hash[el].nil?
      paragraph_hash[el] = 1
    else
      paragraph_hash[el] += 1
    end
  end

  paragraph_hash = paragraph_hash.sort_by{|key,value| value}.to_h

  stop_loop = false

  while stop_loop == false
    paragraph_hash.each do |key,value|
      if total_count(paragraph_hash) - value > 50
        paragraph_hash.delete(key) && unique_characters << key
      else
        stop_loop = true
      end
    end
  end

puts unique_characters
end

get_unique_characters(paragraph)
