
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students, students_with_r, students_less_than_12)
  
  puts "\nAll students:"
  students_printer(students)
  puts "\nNames beginning with 'R':"
  students_printer(students_with_r)
  puts "\nNames shorter than 12 characters:"
  students_printer(students_less_than_12)
end

def students_printer(list_of_students)
  i = 0
  while i < list_of_students.length 
    puts "#{i+1}. #{list_of_students[i][:name]} (#{list_of_students[i][:cohort]} cohort)"
    i += 1
  end
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
  # Storing the cohort name as symbols because we don't expect to do 'String'-like activities
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
