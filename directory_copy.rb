
months = %w(January February March April May June July August September October November December)

def print_header
  puts "The students of Villains Academy".center(40)
  puts "-------------".center(40)
end

def print_students(all_students, months)
  
  cohorts = all_students.group_by{
    |student|
    student[:cohort]
  }.to_a

  cohorts = cohorts.sort_by{
    |cohort|
    months.index(cohort[0].to_s)
}

  cohorts.each{
    |cohort_array|
    puts ""
    students_printer(cohort_array)
  }

end

def students_printer(cohort_data)
  i = 0
  puts "#{cohort_data[0]} cohort:"
  while i < cohort_data[1].length
    puts "#{i+1}. #{cohort_data[1][i][:name]}, who likes #{cohort_data[1][i][:hobby]} and was born in #{cohort_data[1][i][:cob]}."
    i += 1
  end
end

def print_footer(all_students)
  if all_students.count === 0
    puts "There are no students currently enrolled."
  elsif all_students.count === 1
    puts "\nOverall, we have #{all_students.count} great student."
  else
    puts "\nOverall, we have #{all_students.count} great students."
  end
  puts ""
end

def input_students(months)
  puts "Please enter the names of students you want to add."
  puts "To finish, just hit return twice."
  students = []
  name = gets.chomp

  while !name.empty? do
  # Storing the cohort name as symbols because we don't expect to do 'String'-like activities
    name = name.downcase.capitalize()

    puts "Please enter #{name}'s cohort month:"
    cohort = input_info("cohort month").capitalize

    while !months.include?(cohort) do
      puts "Not a valid month. Try again."
      cohort = input_info("cohort month").capitalize
    end

    cohort = cohort.to_sym
    puts "Please enter #{name}'s favorite hobby:"
    hobby = input_info("hobby")
    puts "Please enter #{name}'s country of birth:"
    cob = input_info("country of birth")
    cob = cob.downcase.capitalize()
      
    students.push({name: name, cohort: cohort, hobby: hobby, cob: cob})
    puts students.length === 1 ? "Now we have #{students.length} student." : "Now we have #{students.length} students."
    puts "Please enter the name of a student you want to add:"
    name = gets.chomp
  end

  return students
end

def input_info(attribute)
  info = gets.chomp

  while info.empty? do
    puts "This field cannot be empty. Please input a #{attribute}:"
    info = gets.chomp
  end

  return info.downcase
end

# Nothing happens until we call the methods
all_students = input_students(months)
print_header
print_students(all_students, months)
print_footer(all_students)
