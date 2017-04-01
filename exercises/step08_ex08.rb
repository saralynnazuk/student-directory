=begin
Once you complete the previous exercise, change the way the users are displayed: print them grouped by cohorts. To do this, you'll need to get a list of all existing cohorts (the map() method may be useful but it's not the only option), iterate over it and only print the students from that cohort.
=end

#makes the variable accessible to all methods
@students = []

#returns list of students in seleceted cohort
def filter_by_cohort
  puts "Which cohort would you like to filter by?"
  filter = gets.chomp.capitalize.to_sym
  puts "The students in #{filter} cohort are:"
  selected = @students.select do |student|
    if student[:cohort] == filter
    puts "#{student[:name]}"
    end
  end
  puts selected
end

def add_student_info(name = :Anon_, cohort = :November) #problem - works if I explicitly call the method without any arguments but not sure the defaults works in the context of calling the method within input_students
  @students << {name: name, cohort: cohort}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  puts "First student's name please:"
  name = gets.chomp.capitalize
  while !name.empty? do
  input_cohort(name)
    puts "Now we have #{@students.count} students"
    puts
    puts "Next student's name, please:"
    name = gets.chomp
  end
  #@students
end

def input_cohort(name)
  require "Date"
  puts "Which cohort is #{name} in?"
  cohort = gets.chomp.capitalize
  #checks if cohort is a valid month
  if Date::MONTHNAMES.include? cohort
    cohort = cohort.to_sym
    add_student_info(name, cohort)
  else
    puts "Please enter a valid month (no abbreviations)"
    cohort = gets.chomp.capitalize
    add_student_info(name, cohort) #problem - still possible to get it wrong here (and without this line here, entry won't be added if you got the cohort wrong)
  end
end

def print_header
  puts "The students of Villains Academy".center(80)
  puts "-------------".center(80)
end

def print(students)
  @students.each do |student|
    puts "#{student[:name]}, (#{student [:cohort]} cohort)".center(80)
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(80)
end
input_students
print_header
print(@students)
print_footer
#call new method
filter_by_cohort
