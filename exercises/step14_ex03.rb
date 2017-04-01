=begin
Continue refactoring the code. Which method is a bit too long? What method names are not clear enough? Anything else you'd change to make your code look more elegant? Why?

Note: I used this exercise as a space to incorporate the various ammendments/additions to the code resulting from doing all the other exercises in steps 8 and 14, in preparation for inputing desired changes to directory.rb.
=end

#asterisk(*) added to beginning of feedback messages to make them more visible

@students = [] #an empty array accessible to all methods

#for when input is required from users
@prompt = "->"

#include library
require 'csv'

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

#updated menu wording and added additional options
def print_menu
  puts
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save student list to a file"
  puts "4. Load student list from a file"
  puts "5. Filter by cohort"
  puts "6. Filter by first letter of name"
  puts "7. Filter by name length"
  puts "9. Exit"
  print @prompt
end

#feedback messages inserted for each option
def process(selection)
  case selection
  when "1"
    puts "*You have selected Option 1 - Input the students"
    input_students
  when "2"
    puts "*You have selected Option 2 - Show the students"
    show_students
  when "3"
    puts "*You have selected Option 3 - Save student list to a file"
    save_students
  when "4"
    puts "*You have selected Option 4 - Load student list from a file"
    load_students
  when "5"
    puts "*You have selected Option 5 - Filter by cohort"
    filter_by_cohort
  when "6"
    puts "*You have selected Option 6 - Filter by first letter of name"
    print_by_first_letter
  when "7"
    puts "*You have selected Option 7 - Filter by name length"
    print_by_length
  when "9"
    puts "*You have chosen to exit the directory - Goodbye!"
    exit
  else
    puts "*I don't know what you meant, please try again"
  end
end

#updated to accomodate for singular / plural students
def input_students
  puts "Please enter the names of the students, one at a time"
  puts "First student's name please:"
  print @prompt
  name = STDIN.gets.chomp.capitalize
  while !name.empty? do
    input_cohort(name)
      if @students.length == 1
        puts "Now we have #{@students.count} student"
      elsif @students.length > 1
        puts "Now we have #{@students.count} students"
      end
      puts
      puts "Next student's name, please: (or press enter to finish)"
      print @prompt
      name = STDIN.gets.chomp
  end
end

def input_cohort(name)
  require "Date"
  puts "Which cohort is #{name} in?"
  print @prompt
  cohort = STDIN.gets.chomp.capitalize
  while !Date::MONTHNAMES.include? cohort
    puts "Please enter a valid month (no abbreviations)"
    cohort = STDIN.gets.chomp.capitalize
  end
    add_student_info(name, cohort)
  end

#helps with DRY principle - used in input_students and load_students
def add_student_info(name, cohort)
  @students << {name: name, cohort: cohort}
end

def show_students
  print_header
  print_student_list_with_index
  print_footer
end

# used .center(50) on print_header, print_student_list, and print_footer
def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

#student list with index
def print_student_list_with_index
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student [:cohort]} cohort)".center(50)
  end
end

#accomodates for singular / plural students
def print_footer
  if @students.count == 1
    puts "We have one fantastic student".center(50)
  elsif @students.count > 1
    puts "Overall, we have #{@students.count} great students".center(50)
  else
    puts "We don't have any students yet!".center(50)
  end
end

#refactored to use library
def save_students
  filename = user_chose_file
  CSV.open(filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      file << student_data
    end
  end
  puts "*Students successfully saved to #{filename}"
end

#refactored to use library
def load_students
  filename = user_chose_file
  CSV.foreach(filename, "r") do |row|
    name, cohort = row
    cohort = cohort.to_sym
    add_student_info(name, cohort)
  end
  puts "*Successfully loaded from #{filename}"
end

#helps with DRY principle - used in save_students and load_students
def user_chose_file
  puts "Please specify a file (with extection .csv):"
  print @prompt
  filename = STDIN.gets.chomp
end

#returns list of students in seleceted cohort
def filter_by_cohort
  puts "Which cohort would you like to filter by?"
  print @prompt
  filter = STDIN.gets.chomp.capitalize
  puts "*The students in this cohort are:"
  selected = @students.select do |student|
    if student[:cohort] == filter
    puts "#{student[:name]}"
    end
  end
  puts selected
end

#allows you to only print students whose name begins with a certain, specified letter
def print_by_first_letter
  puts "Which letter would you like to filter by?"
  print @prompt
  letter = STDIN.gets.chomp.capitalize
  puts "*Students whose name begins with #{letter}:"
  @students.each do |student|
    if student[:name].start_with?(letter)
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

#allows you to only print students whose name is fewer than a given number of characters
def print_by_length
  puts "What it the maximum number of characters?"
  print @prompt
  max = STDIN.gets.chomp.to_i
  puts "*Students with names fewer than #{max} characters:"
  @students.each do |student|
    if student[:name].length < max
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

#NOT WORKING PROPERLY!!!
def try_load_students
  filename = ARGV.first || "students.csv"  #first argument from the command line - will load "students.csv" as default
  return if filename.nil? #get out of the method if it isn't given
  if File.exists?(filename) #if it exists
    load_students   #(filename)
    puts "*Loaded #{@students.count} from #{filename}"
  else #if it doesn't exists
    puts "*Sorry, #{filename} doesn't exist."
    exit #quit the program
  end
end

interactive_menu
