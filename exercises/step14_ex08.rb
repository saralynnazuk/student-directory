=begin
Write a short program that reads its own source code (search StackOverflow to find out how to get the name of the currently executed file) and prints it on the screen.
=end

#ruby curently executed file: $0

puts open($0).read

#alternatively: puts File.read(__FILE__)
