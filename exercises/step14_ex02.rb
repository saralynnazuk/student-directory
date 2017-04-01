=begin
How could you make the program load students.csv by default if no file is given on startup? Which methods would you need to change?
=end

@students = []

#load_students() will load from "students.csv" if no other filename is supplied
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

#try_load_students() changed to load students.csv by default
def try_load_students
  filename = ARGV.first || "students.csv"
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
