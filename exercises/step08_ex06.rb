=begin
Research how the method center() of the String class works. Use it in your code to make the output beautifully aligned.
=end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
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

#centered
def print_header
  puts "The students of Villains Academy".center(80)
  puts "-------------".center(80)
end

#centered
def print(students)
  students.each do |student|
    puts "#{student[:name]}, (#{student [:cohort]} cohort), Place of birth: #{student[:country]}, Favourite hobby: #{student[:hobby]}".center(80)
  end
end

#centered
def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(80)
end

students = input_students
print_header
print(students)
print_footer(students)
