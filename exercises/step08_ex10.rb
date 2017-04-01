=begin
We've been using the chomp() method to get rid of the last return character. Find another method among those provided by the String class that could be used for the same purpose (although it will require passing some arguments).
=end

=begin
#definition "chomp" for String class

chomp(separator=$/) → new_str
Returns a new String with the given record separator removed from the end of str (if present). If $/ has not been changed from the default Ruby record separator, then chomp also removes carriage return characters (that is it will remove \n, \r, and \r\n). If $/ is an empty string, it will remove all trailing newlines from the string.

#alternatives for "chomp" from String class

delete([other_str]+) → new_str
Returns a copy of str with all characters in the intersection of its arguments deleted.

strip → new_str
Returns a copy of str with leading and trailing whitespace removed.
=end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
#using 'delete()' instead of chomp
  name = gets.delete("\n")
  while !name.empty? do
    students << {name: name, cohort: :november}
    if students.length == 1
      puts "Now we have #{students.count} student"
    elsif students.length > 1
      puts "Now we have #{students.count} students"
    end
#using 'strip' instead of chomp
    name = gets.strip
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(80)
  puts "-------------".center(80)
end

def print(students)
  students.each do |student|
    puts "#{student[:name]}, (#{student[:cohort]} cohort)".center(80)
  end
end

def print_footer(students)
  if students.count == 1
    puts "We have one fantastic student".center(80)
  elsif students.count > 1
    puts "Overall, we have #{students.count} great students".center(80)
  else
    puts "We don't have any students yet!".center(80)
  end
end

students = input_students
print_header
print(students)
print_footer(students)
