
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

def print(students, students_with_r)
  puts "\nAll students:"
  students.each_with_index{
    |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  }

  puts "\nNames beginning with 'R':"
  students_with_r.each_with_index{
    |student, index|
    if student[:name].split('')[0] === "R"
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  }
end

def print_footer(students, students_with_r)
  puts "\nOverall, we have #{students.count} great students."
  puts "We have #{students_with_r.count} students whose names start with R."
end

def input_students()
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice."
  students = []
  students_with_r = []
  name = gets.chomp

  while !name.empty? do
    if name.split("")[0] == 'R'
      students_with_r.push({name: name, cohort: :november})
      students.push({name: name, cohort: :november})
    else
      students.push({name: name, cohort: :november})
    end
    
    puts "Now we have #{students.length} students."
    name = gets.chomp
  end

  return [students, students_with_r]
end

# Nothing happens until we call the methods
data = input_students
print_header
print(data[0], data[1])
print_footer(data[0], data[1])
