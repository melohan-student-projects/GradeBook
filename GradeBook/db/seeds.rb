puts "----------------------------------------------------------------------------------------------------------------"

puts "Creating user types..."

UserType.create!(
  name: "Administrator",
  slug: "admin",
  description: "Admin users can perform all actions within the system."
)

UserType.create!(
  name: "Teacher",
  slug: "teacher",
  description: "Teacher users can view and manage their student records."
)

UserType.create!(
  name: "Student",
  slug: "student",
  description: "Student users can view their own records and grades."
)

puts "User types created successfully!"

puts "----------------------------------------------------------------------------------------------------------------"


puts "Creating users ..."

admin_user_type = UserType.find_by(slug: "admin")
teacher_user_type = UserType.find_by(slug: "teacher")
student_user_type = UserType.find_by(slug: "student")

User.create!(
  firstname: "Rachel",
  lastname: "Green",
  email: "rachel.green@cpnv.ch",
  password: "rgreen12345",
  user_type: student_user_type
)

User.create!(
  firstname: "Ada",
  lastname: "Lovelace",
  email: "ada.lovelace@cpnv.ch",
  password: "alovelace12345",
  user_type: teacher_user_type
)

User.create!(
  firstname: "John",
  lastname: "Doe",
  email: "john.doe@cpnv.ch",
  password: "jdoe12345",
  user_type: admin_user_type
)
puts "User created successfully!"

puts "----------------------------------------------------------------------------------------------------------------"

puts "Creating categories ..."
Category.create!(name: 'General branches')
Category.create!(name: 'Application modules and work experience')
Category.create!(name: 'Specific modules')
puts "Categories created successfully!"
puts "----------------------------------------------------------------------------------------------------------------"
puts "Creating lectures ..."
Lecture.create!(name: 'FR', description: 'French language course', category_id: Category.find_by(name: 'General branches').id)
Lecture.create!(name: 'POO1', description: 'Introduction to Object-Oriented Programming', category_id: Category.find_by(name: 'Specific modules').id)
Lecture.create!(name: 'Stage', description: 'Professional internship', category_id: Category.find_by(name: 'Application modules and work experience').id)
puts "Lectures created successfully!"
puts "----------------------------------------------------------------------------------------------------------------"

