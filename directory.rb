
# Prints the list of students
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
puts "The students of Villains Academy"
puts "-------------"
students.each {
  |student|
  puts student
}

# Prints the total number of students using string interpolation
puts "Overall, we have #{students.length} great students."