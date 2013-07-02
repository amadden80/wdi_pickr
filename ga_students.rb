require 'pry'

class Student

  attr_accessor :first_name, :last_name, :email
  def initialize(first_name, last_name, email)
    @first_name = first_name
    @last_name = last_name
    @email = email
  end
  def full_name
    self.first_name + ' ' + self.last_name
  end
  def to_s
    self.full_name
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.groups_of(n)
    Student.all.shuffle.each_slice(n).to_a
  end

  def self.assign_groups_of(n)
    student_groups = groups_of(n)
    counter = 1
    student_groups.each do |group|
      puts "Group #{counter}:"
      puts group
      puts
      counter += 1
    end
    nil
  end
end

def menu
  puts 'Please choose an option or (q)uit: '
  puts '1. Assign Random Groups'
  puts '2. Pick Random student'
  gets.chomp
end

def pick_groups
  print "Groups of what size? "
  group_size = gets.chomp.to_i
  puts `clear`
  Student.assign_groups_of(group_size)
end

def random_student
  rand_student = Student.all.shuffle.first
  puts `clear`
  puts "Random Student: #{rand_student.first_name} #{rand_student.last_name}"
  puts ''
end

students = [
  Student.new("Alex", "Davidow", 'alex.davidow@gmail.com'),
  Student.new("David", "Aaron", 'davidmatthewaaron@gmail.com'),
  Student.new("Jamie", "Yu-Ramos", 'pccjamie@gmail.com'),
  Student.new("Lee", "Hampton", 'leejhampton@gmail.com'),
  Student.new("Michael", "Frohberg", 'michaelfrohberg@live.com'),
  Student.new("Mike", "Reinhart", 'mreinhart88@gmail.com'),
  Student.new("George", "Rodriguez", '1@6e0r9e.com'),
  Student.new("Tanay", "Jalan", 'tanayjalan@gmail.com'),
  Student.new("Chris", "Eichler", 'chriseichler@gmail.com'),
  Student.new("Isabel", "Cortes", 'belcortes@gmail.com'),
  Student.new("Andrew", "Madden", 'amadden80@gmail.com'),
  Student.new("Remy", "Bartolotta", 'remy.bartolotta@gmail.com'),
  Student.new("Bernard", "Doherty", 'schechtermike@gmail.com'),
  Student.new("Mike", "Schechter", 'bernard.doherty@icloud.com'),
  Student.new("Ryan", "Kuhel", 'ryan.kuhel@gmail.com'),
  Student.new("Frank", "Mendez", 'fmendez133@gmail.com')
]

puts `clear`
puts '---------------------------------------------------------------'
puts 'Welcome to the All-Seeing, All-Knowing General Assembly Student Tracker'
puts '---------------------------------------------------------------'
puts ''

response = ''
while response != 'q'
  response = menu
  case response
  when '1'
    pick_groups
    puts 'Press ENTER to continue.'
    gets
    puts `clear`
  when '2'
    random_student
    puts 'Press ENTER to continue.'
    gets
    puts `clear`
  when 'q'
    puts 'Goodbye!'
  else
    puts 'Invalid entry, please try again.'
  end
end
