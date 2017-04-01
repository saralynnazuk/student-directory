=begin
After we added the code to load the students from file, we ended up with adding the students to @students in two places. The lines in load_students() and input_students() are almost the same. This violates the DRY (Don't Repeat Yourself) principle. How can you extract them into a method to fix this problem?
=end

@students = []

#new method that can be called in load_students() and input_students() note: input_students() calls input_cohort(), which then calls add_student_info()
def add_student_info (name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  puts "First student's name please:"
  name = STDIN.gets.chomp.capitalize
  while !name.empty? do
  input_cohort(name)
    puts "Now we have #{@students.count} students"
    puts
    puts "Next student's name, please:"
    name = gets.chomp
  end
  @students
end

def input_cohort(name)
  require "Date"
  puts "Which cohort is #{name} in?"
  cohort = gets.chomp.capitalize
  while !Date::MONTHNAMES.include? cohort
    puts "Please enter a valid month (no abbreviations)"
    cohort = gets.chomp.capitalize
  end
    add_student_info(name, cohort)
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    add_student_info(name, cohort) 
  end
  file.close
end

def print_header
  puts "The students of Villains Academy".center(80)
  puts "-------------".center(80)
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]}, (#{student [:cohort]} cohort)".center(80)
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(80)
end

input_students
print_header
print_student_list
print_footer
