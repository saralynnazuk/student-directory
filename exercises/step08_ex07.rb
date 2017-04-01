=begin
In the input_students method the cohort value is hard-coded. How can you ask for both the name and the cohort? What if one of the values is empty? Can you supply a default value? The input will be given to you as a string? How will you convert it to a symbol? What if the user makes a typo?
=end

#makes the variable accessible to all methods
@students = []

#default values set for arguments
def add_student_info(name = :Anon_, cohort = :November) #problem - works if I explicitly call the method without any arguments but not sure the defaults works in the context of calling the method within input_students
  @students << {name: name, cohort: cohort}
end

def input_students
  puts "Please enter the names of the students, one at a time"
  puts "To finish, just hit return twice"
  puts "First student's name please:"
  name = gets.chomp.capitalize
  while !name.empty? do
  #cohort name no longer hard-coded
  input_cohort(name)
    puts "Now we have #{@students.count} students"
    puts
    puts "Next student's name, please:"
    name = gets.chomp
  end
end

def input_cohort(name)
  require "Date"
  puts "Which cohort is #{name} in?"
  cohort = gets.chomp.capitalize
  #checks if cohort is a valid month
  while !Date::MONTHNAMES.include? cohort
    puts "Please enter a valid month (no abbreviations)"
    cohort = gets.chomp.capitalize #.to_sym ??
  end
    add_student_info(name, cohort)
  end

def print_header
  puts "The students of Villains Academy".center(80)
  puts "-------------".center(80)
end

def print #(students)
  @students.each do |student|
    puts "#{student[:name]}, (#{student [:cohort]} cohort)".center(80)
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(80)
end

input_students
print_header
print
print_footer


=begin
#a way of asking for both name and cohort at same time
def input_students_1
  puts "Please enter student's name and full cohort month, separated by a coma"
  reply = gets.chomp
  name = reply.split(", ")[0]
  cohort = reply.split(", ")[1]
  students = []
  while !reply.empty? do
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    puts "Next student's name, please:"
    reply = gets.chomp
    name = reply.split(", ")[0]
    cohort = reply.split(", ")[1]
  end
  students
end

- - - - -

#how you can individually ask for cohort and other bits of info
def input_students_2
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    #ask for cohort
    puts "Please enter the student's cohort"
    cohort = gets.chomp

    puts "Please enter the student's country of birth"
    country = gets.chomp

    puts "Please enter the student's favourite hobby"

    hobby = gets.chomp
    students << {
      name: name,
      cohort: cohort,
      country: country,
      hobby: hobby
    }
    puts "Now we have #{students.count} students"
    puts "Next student's name, please:"
    name = gets.chomp
  end
  students
end

#to accompany input_students_2
def print(students)
  students.each do |student|
    puts "#{student[:name]}, (#{student [:cohort]} cohort), Place of birth: #{student[:country]}, Favourite hobby: #{student[:hobby]}".center(80)
  end
end
=end

=begin

I toyed with including a method to check whether user had inputted the name correctly (and give user a chance to ammend misktakes) but I couldn't quite get it to work...

def input_students
  puts "Please enter the names of the students, one at a time"
  puts "To finish, just hit return twice"
  puts "First student's name please:"
  name = gets.chomp.capitalize
  check_name(name)
  while !name.empty? do
  input_cohort(name)
    puts "Now we have #{@students.count} students"
    puts
    puts "Next student's name, please:"
    name = gets.chomp
    check_name(name)
  end
end

def check_name(name)
  unless name.empty?
  puts "You've entered '#{name}', is this correct? y/n"
  edit = STDIN.gets.chomp.downcase
    if edit == "n"
      puts "Please enter the correct name"
      new_name = STDIN.gets.chomp
      check_name(new_name)
    else
      new_name
    end
  end
end

def input_cohort(name)
  require "Date"
  puts "Which cohort is #{name} in?" #problem - if incorrect name given above, this will reference the incorrect name rather than the new(correct) name
  cohort = gets.chomp.capitalize
  while !Date::MONTHNAMES.include? cohort
    puts "Please enter a valid month (no abbreviations)"
    cohort = gets.chomp.capitalize #.to_sym ??
  end
    add_student_info(name, cohort)
  end
=end
