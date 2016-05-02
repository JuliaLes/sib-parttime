
puts ' '
puts "The following are two interesting string methods with explanations.\n "

puts "The first is slice. Using slice(index) will return the item in 
a given string at that index value. For example:\n "

puts '"William Shakespeare".slice(0) => W'
puts ' '
puts "and \n "

puts '"William Shakespeare".slice(-2) => r'
puts ' '
puts "You can also have .slice return a range of items in the string. \nFor instance: \n "

puts '"William Shakespeare".slice(0..3) => Will'


puts "\n \n "

puts "Another interesting string method is split.\nSplit allows you take the contents of a string and return them as an arry. \n "
puts "Here is an example:\n "

puts '"To be, or not to be".slice => ["To","be",","or","not","to","be"]'
puts ' '

puts "You can specify the item by which you would like to separate the \nContents of your string in parenthases and single quotations following\nthe method. For example: \n "
puts '"To be, or not to be".slice(\',\') => ["To be","or not to be"]'
puts ' '
puts "Note that in the first example, all of the spaces were removed\n"
puts "from in the string by default, and that the comma we specified\nin the second example was removed from the string as shown in\nthe array.\n"






