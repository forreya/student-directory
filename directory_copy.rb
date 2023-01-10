@months = %w(January February March April May June July August September October November December)
@all_students = []

def print_header
  puts "The students of Villains Academy".center(40)
  puts "-------------".center(40)
end

def print_all_students()
  cohorts = @all_students.group_by{
    |student|
    student[:cohort]
  }.to_a

  cohorts = cohorts.sort_by{
    |cohort|
    @months.index(cohort[0].to_s)
}

  cohorts.each{
    |cohort_array|
    puts ""
    print_cohort(cohort_array)
  }
end

def print_cohort(cohort_data)
  i = 0
  puts "#{cohort_data[0]} cohort:"
  while i < cohort_data[1].length
    puts "#{i+1}. #{cohort_data[1][i][:name]}, who likes #{cohort_data[1][i][:hobby]} and was born in #{cohort_data[1][i][:cob]}."
    i += 1
  end
end

def print_footer()
  if @all_students.empty?
    puts "\nThere are no students currently enrolled."
  elsif @all_students.count === 1
    puts "\nOverall, we have #{@all_students.count} great student."
  else
    puts "\nOverall, we have #{@all_students.count} great students."
  end
  puts ""
end

def input_students()
  puts "Please enter the names of students you want to add."
  puts "To finish, just hit return twice."
  students = []
  name = gets.chomp

  while !name.empty? do
  # Storing the cohort name as symbols because we don't expect to do 'String'-like activities
    name = name.downcase.capitalize()

    puts "Please enter #{name}'s cohort month:"
    cohort = input_info("cohort month").capitalize

    while !@months.include?(cohort) do
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

def print_menu
  puts "What would you like to do?"
  puts "1. Input students"
  puts "2. Display students."
  puts "3. Save data."
  puts "9. Exit"
end

def display_students()
  print_header
  print_all_students()
  print_footer()
end

def save_data
  # Open the file for writing
  file = File.open("students.csv", "w")
  # Iterate over the array of students
  @all_students.each {
    |student|
    student_array = [student[:name], student[:cohort], student[:hobby], student[:cob]]
    file.puts(student_array.join(","))
  }
  file.close
  puts "\nData saved."
  puts ""
end

def selection_process(selection)
  case selection
  when "1"
    @all_students = input_students
  when "2"
    display_students
  when "3"
    save_data
  when "9"
    # Exits the program
    exit
  else
    puts "That is not a valid selection."
  end
end

def interactive_menu
  loop do
    print_menu
    selection_process(gets.chomp)
  end
end

# Nothing happens until we call the method
interactive_menu
