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
  firstname: "Monica",
  lastname: "Geller",
  email: "monica.geller@cpnv.ch",
  password: "mgeller12345",
  user_type: student_user_type
)

User.create!(
  firstname: "Phoebe",
  lastname: "Buffay",
  email: "phoebe.buffay@cpnv.ch",
  password: "pbuffay12345",
  user_type: student_user_type
)

User.create!(
  firstname: "Joey",
  lastname: "Tribbiani",
  email: "joey.tribbiani@cpnv.ch",
  password: "jtribbiani12345",
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
puts "Creating promotions ..."

# Recherche de l'enseignante Ada Lovelace
teacher = User.find_by(firstname: "Ada", lastname: "Lovelace")

# Création des promotions
promotion = Promotion.create!(
  name: "Si-T2a",
  start_date: Date.parse("23/08/2019"),
  end_date: Date.parse("1/7/2021"),
  teacher_id: teacher.id
)

promotion = Promotion.create!(
  name: "Si-T2b",
  start_date: Date.parse("23/08/2020"),
  end_date: Date.parse("1/7/2022"),
  teacher_id: teacher.id
)

puts "Promotions created successfully!"
puts "----------------------------------------------------------------------------------------------------------------"
puts "Adding students to promotions..."

promotion_1 = Promotion.find_by(start_date: Date.parse("23/08/2019"))
promotion_2 = Promotion.find_by(start_date: Date.parse("23/08/2020"))

student1 = User.find_by(email: "rachel.green@cpnv.ch")
student2 = User.find_by(email: "monica.geller@cpnv.ch")
student3 = User.find_by(email: "phoebe.buffay@cpnv.ch")
student4 = User.find_by(email: "joey.tribbiani@cpnv.ch")

UserPromotion.create!(
  promotion_id: promotion_1.id,
  student_id: student1.id
)

UserPromotion.create!(
  promotion_id: promotion_1.id,
  student_id: student2.id
)

UserPromotion.create!(
  promotion_id: promotion_2.id,
  student_id: student3.id
)

UserPromotion.create!(
  promotion_id: promotion_2.id,
  student_id: student4.id
)

puts "Students added successfully!"
puts "--------------------------"
