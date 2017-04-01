=begin
Rewrite the each() method that prints all students using while or until control flow methods (Loops).
=end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end


#rewritten to use while loop instead of each
def print(students)
  count = 0
  while count < students.length
    puts "#{students[count][:name]} (#{students[count][:cohort]} cohort)"
    count += 1
  end
end

=begin
#and here's what it could look like using an until loop:
def print(students)
  count = 0
  until count == students.length
    puts "#{students[count][:name]} (#{students[count][:cohort]} cohort)"
    count += 1
  end
end
=end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
