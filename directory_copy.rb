
# Storing the cohort name as symbols because we don't expect to do 'String'-like activities
# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Krueger", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :november}
# ]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students, students_with_r, students_less_than_12)
  puts "\nAll students:"
  students.each_with_index{
    |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  }

  puts "\nNames beginning with 'R':"
  students_with_r.each_with_index{
    |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  }

  puts "\nNames shorter than 12 characters:"
  students_less_than_12.each_with_index{
    |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  }
end

def print_footer(students, students_with_r, students_less_than_12)
  puts "\nOverall, we have #{students.count} great students."
  puts "#{students_with_r.count} students have names starting with R."
  puts "#{students_less_than_12.count} students have names shorter than 12 characters."
end

def input_students()
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice."
  students = []
  students_with_r = []
  students_less_than_12 = []
  name = gets.chomp

  while !name.empty? do
    if name.split("")[0] == 'R'
      students_with_r.push({name: name, cohort: :november})
    end
    if name.split('').length < 12
      students_less_than_12.push({name: name, cohort: :november})
    end
      
    students.push({name: name, cohort: :november})
    puts "Now we have #{students.length} students."
    name = gets.chomp
  end

  return [students, students_with_r, students_less_than_12]
end

# Nothing happens until we call the methods
data = input_students
print_header
print(data[0], data[1], data[2])
print_footer(data[0], data[1], data[2])
