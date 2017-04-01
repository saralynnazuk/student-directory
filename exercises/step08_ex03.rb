=begin
Modify your program to only print the students whose name is shorter than 12 characters.
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

def print(students)
  students.each_with_index do |student, index|
    puts " #{index + 1}. #{student[:name]} (#{student [:cohort]} cohort)"
  end
end

def print_by_first_letter(students, letter)
  students.each do |student|
    if student[:name][0] == letter
    puts "#{student[:name]} (#{student [:cohort]} cohort)"
    end
  end
end

#allows you to only print students whose name is fewer than a given number of characters
def print_by_length(students, max)
  puts "Students with names fewer than #{max} characters:"
  students.each do |student|
    if student[:name].length < max
    puts "#{student[:name]} (#{student [:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_by_length(students, 12)

#first attempt, see below - modified input_students directly
=begin
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  #will only print students whose name is fewer than 12 characters long
  while !name.empty? && name.length < 12 do
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

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student [:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
=end
