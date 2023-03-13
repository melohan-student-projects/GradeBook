puts "--------------"

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

puts "--------------"

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

puts "Users created successfully!"