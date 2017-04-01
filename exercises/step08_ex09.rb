=begin
Right now if we have only one student, the user will see a message "Now we have 1 students", whereas it should be "Now we have 1 student". How can you fix it so that it used singular form when appropriate and plural form otherwise?
=end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
#update appropriate singular/plural form
    if students.length == 1
      puts "Now we have #{students.count} student"
    elsif students.length > 1
      puts "Now we have #{students.count} students"
    end
    name = gets.chomp
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

#update appropriate singular/plural form here too
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
