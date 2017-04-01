=begin
The filename we use to save and load data (menu items 3 and 4) is hardcoded. Make the script more flexible by asking for the filename if the user chooses these menu items.
=end

@students = []

#updated menu wording
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

#updated feedback messages to match new menu wording
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
  name = STDIN.gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
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

#asks user for file name
def user_chose_file
  puts "Please specify a file:"
  filename = STDIN.gets.chomp
end

#user now supplies name of file for saving data
def save_students
  filename = user_chose_file
  #open the file for writing
  file = File.open(filename, "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

#user now supplies name of file from which to load data
def load_students
  filename = user_chose_file
  #open the file for reading
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

interactive_menu
