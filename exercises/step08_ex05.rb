=begin
Our code only works with the student name and cohort. Add more information: hobbies, country of birth, height, etc.
=end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
#get additional info about students
    puts "Please enter the student's country of birth"
    country = gets.chomp

    puts "Please enter the student's favourite hobby"
    hobby = gets.chomp

    students << {
      name: name,
      cohort: :november,
      country: country,
      hobby: hobby
    }
    
    puts "Now we have #{students.count} students"
    puts "Next student's name, please:"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
#add additional info here too
def print(students)
  students.each do |student|
    puts "#{student[:name]}, (#{student [:cohort]} cohort), Place of birth: #{student[:country]}, Favourite hobby: #{student[:hobby]}"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
