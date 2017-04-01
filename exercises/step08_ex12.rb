=begin
What happens if the user doesn't enter any students? It will try to print an empty list. How can you use an if statement (Control Flow) to only print the list if there is at least one student in there?
=end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  if name.empty?
    puts "You did not enter a name - please do so now"
  else
    while !name.empty? do
    students << {name: name, cohort: :november}
      if students.length == 1
        puts "Now we have #{students.count} student"
      elsif students.length > 1
        puts "Now we have #{students.count} students"
      end
    name = gets.chomp
  end

end

  students
end

#will print regardless of number of students as the two methods below take appropriate action depending on number of students (if desired, this method could easily be altered to not print unless there are students)
def print_header
  puts "The students of Villains Academy".center(80)
  puts "-------------".center(80)
end

#only prints if there are students
def print(students)
  if !students.empty?
    students.each do |student|
    puts "#{student[:name]}, (#{student[:cohort]} cohort)".center(80)
    end
  end
end

#output dependent upon number of students
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
