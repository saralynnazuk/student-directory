=begin
Modify your program to only print the students whose name begins with a specific letter.
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

#allows you to only print students whose name begins with a certain, specified letter
def print_by_first_letter(students, letter)
  puts "Students whose name begins with #{letter}:"
  students.each do |student|
    if student[:name].start_with?(letter) #alternate syntax -> if student[:name][0] == letter
      puts "#{student[:name]} (#{student [:cohort]} cohort)"
    end
  end
end

=begin
#this way works as well and gives you index numbers

def print_by_first_letter_with_index(students, letter)
  students.each_with_index do |student, i|
    if students[i][:name].start_with?(letter)
      puts "#{i + 1}. #{student[:name]} (#{student[:cohort]})"
    end
  end
end
=end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_by_first_letter(students, "N")


#first attempt, see below - modified input_students directly
=begin
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
#will only print students whose name begins with "N"
  while !name.empty? && name.start_with?("N") do
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
