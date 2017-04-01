=begin
We are de-facto using CSV format to store data. However, Ruby includes a library to work with the CSV files that we could use instead of working directly with the files. Refactor the code to use this library.
=end

@students = []

#include library
require 'csv'

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    puts "You have selected Option 1 - Input the students"
    input_students
  when "2"
    puts "You have selected Option 2 - Show the students"
    show_students
  when "3"
    puts "You have selected Option 3 - Save the list to a file"
    save_students
  when "4"
    puts "You have selected Option 4 - Load the list from a file"
    load_students
  when "9"
    puts "You have chosen to exit the directory - Goodbye!"
    exit
  else
    puts "I don't know what you meant, please try again"
  end
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
end

def add_student_info (name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def input_cohort(name)
  require "Date"
  puts "Which cohort is #{name} in?"
  cohort = gets.chomp.capitalize
  if Date::MONTHNAMES.include? cohort
    cohort = cohort.to_sym
    add_student_info(name, cohort)
  else
    puts "Please enter a valid month (no abbreviations)"
    cohort = gets.chomp.to_sym
    add_student_info(name, cohort)
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(80)
  puts "-------------".center(80)
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(80)
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(80)
end

def user_chose_file
  puts "Please specify a file:"
  filename = STDIN.gets.chomp
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
  puts "Students successfully saved to #{filename}"
end

#refactored to use library
def load_students
  filename = user_chose_file
  CSV.foreach(filename, "r") do |row|
    name, cohort = row
    cohort = cohort.to_sym
    #alternatively, could replace the above 2 lines with the below two lines
    #name = row[0]
    #cohort = row[1]
    add_student_info(name, cohort)
  end
  puts "Successfully loaded from #{filename}"
end

interactive_menu
