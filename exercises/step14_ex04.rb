=begin
Right now, when the user choses an option from our menu, there's no way of them knowing if the action was successful. Can you fix this and implement feedback messages for the user?
=end

#feedback messages inserted for each option
def process(selection)
  case selection
  when "1"
    puts "You have selected Option 1 - Input the students"
    input_students
  when "2"
    puts "You have selected Option 2 - Show the students"
    show_students
  when "3"
    puts "You have selected Option 3 - Save the list to students.csv"
    save_students
  when "4"
    puts "You have selected Option 4 - Load the list from students.csv"
    load_students
  when "9"
    puts "You have chosen to exit the directory - Goodbye!"
    exit
  else
    puts "I don't know what you meant, please try again"
  end
end
